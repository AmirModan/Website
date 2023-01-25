import Head from 'next/head'

function Home() {

    return (
        <>
            <Head>
                <title>My Home</title>
                <meta name="viewport" />
            </Head>
            <div>Welcome, Explorer!</div>
            <button onClick={handleClick}>Click me!</button>
        </>
    )
}

async function handleClick (e) {
    e.preventDefault()
    await fetch(
        `.netlify/functions/subscribe`,
        {
          method: "POST",
          body: JSON.stringify({
            subscriberName: "amir5modan@gmail.com",
            subscriberEmail: "amir5modan@gmail.com",
            inviteeEmail: "amir5modan@gmail.com",
          }),
        }
      );
}
export default Home