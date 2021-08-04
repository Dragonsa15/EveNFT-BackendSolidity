const Web3 = require('web3');
const json = require('../../build/contracts/EtherPage.json');
const abi = json['abi']
const address = Object.values(json['networks'])[0]['address'];

// console.log(abi,network);

let app = document.querySelector('#app')

app.innerHTML = '<h2>Welcome to millionaaaather-page</h2>'
// if (typeof web3 !== 'undefined') {
//     web3 = new Web3(web3.currentProvider);
// } else {
// const web3 = new Web3(ganache.provider());

// set the provider you want from Web3.providers
// console.log(new Web3.providers.HttpProvider("http://localhost:8545"));

web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));

let main =  async () => {
    web3.eth.defaultAccount = (await web3.eth.getAccounts())[0];

    EtherPageContract = new web3.eth.Contract(abi, address);

    let testCanvas = async() => {

        await EtherPageContract.methods.addCanvas(10, 10, 100).send({from: web3.eth.defaultAccount});
        await EtherPageContract.methods.ChangePixel(0, 10, 10, "0xFFFFFF").send({from: web3.eth.defaultAccount});

        let pixelValue = await EtherPageContract.methods.getPixel(0, 10, 10).call();
        console.log(pixelValue);
    }

    testCanvas()
}

main ()