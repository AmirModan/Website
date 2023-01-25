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
        `.netlify/functions/sendEmail`,
        {
          method: "POST",
          body: JSON.stringify({
            subscriberName: "Amir Modan",
            subscriberEmail: "amirmodan@yahoo.com",
            inviteeEmail: "amir5modan@gmail.com",
          }),
        }
      );
}
export default Home