let currentAccount = null;

    // Method to connect the metamask
    async function connectMetaMask() {
        if (typeof window.ethereum !== 'undefined') {
            try {
                // Request access to MetaMask accounts
                const accounts = await window.ethereum.request({
                    method: 'eth_requestAccounts'
                });

                if (accounts.length === 0) {
                    alert('No MetaMask account found. Please create or import an account.');
                    return;
                }

                currentAccount = accounts[0];
                document.getElementById('account').innerText = currentAccount;

                // Initialize web3 with MetaMask provider
                window.web3 = new Web3(window.ethereum);

                // Get network + currency
                const chainId = await window.ethereum.request({
                    method: 'eth_chainId'
                });

                const network = getCurrencyByChainId(chainId);
                document.getElementById('currency').innerText = network.symbol;

            } catch (error) {
                console.error('Error connecting to MetaMask:', error);
                alert('Failed to connect to MetaMask. Please try again.');
            }
        } else {
            alert('MetaMask is not installed. Please install MetaMask to use this feature');
        }
    }

 
    // Method to get and display the account balance
    async function getBalance() {
        if (typeof web3 !== 'undefined' && currentAccount) {
            try {
                // Get connected account balance
                const balanceWei = await web3.eth.getBalance(currentAccount);

                // Wei to Ether conversion
                const balance = web3.utils.fromWei(balanceWei, 'ether');

                // Display the balance
                document.getElementById('balance').innerText = balance;
            } catch (error) {
                console.error('Error fetching balance:', error);
                alert('Failed to fetch the balance. Please try again.');
            }
        } else {
            alert('Metamask is not conencted. Please connect Metamask first.')
        }
    }

    // Method for currency
    function getCurrencyByChainId(chainId) {
    const networks = {
        '0x1': { name: 'Ethereum Mainnet', symbol: 'ETH' },
        '0x5': { name: 'Goerli Testnet', symbol: 'ETH' },
        '0xaa36a7': { name: 'Sepolia Testnet', symbol: 'ETH' },
        '0x89': { name: 'Polygon Mainnet', symbol: 'MATIC' },
        '0x13881': { name: 'Mumbai Testnet', symbol: 'MATIC' },
        '0x38': { name: 'BNB Smart Chain', symbol: 'BNB' },
        '0xa86a': { name: 'Avalanche', symbol: 'AVAX' },
        '0xfa': { name: 'Fantom', symbol: 'FTM' }
    };

    return networks[chainId] || { name: 'Unknown Network', symbol: 'Unknown' };
    }

    // Method to update when currency changed
    if (window.ethereum) {
    window.ethereum.on('chainChanged', (chainId) => {
        const network = getCurrencyByChainId(chainId);
        document.getElementById('currency').innerText = network.symbol;
        document.getElementById('balance').innerText = '';
    });
    }

