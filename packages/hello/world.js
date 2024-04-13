//--web true
//--param DEFAULT_MESSAGE $DEFAULT_MESSAGE
function main(args) {
    let message = args.name || args.DEFAULT_MESSAGE || "stranger"
    return {
        "body": `<h1>Hello, ${message}</h1>`
    }
}