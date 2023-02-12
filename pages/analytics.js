import Head from 'next/head'
import Header from '../public/components/Header'

function Contact() {
    async function handleSubmit(event) {
        event.preventDefault();
        //call to the Netlify Function you created
        const response = await fetch(".netlify/functions/updateDB", {
            method: "POST",
            body: JSON.stringify({
                page: "Analytics",
            }),
        });
        if (!response.ok) {
            const messageStatus = document.getElementById("message-status");
            messageStatus.innerText = "Information could not be retrieved. Please try again later";
            messageStatus.style.color = "red"
            //messageStatus.style.background = "white"
            //throw new Error(`HTTP error! status: ${response.status}`);
        } else {
            const messageStatus = document.getElementById("message-status");
            messageStatus.innerText = __filename + "Information updated!";
            messageStatus.style.color = "green"
        }
    }

    return (
        <>
            <Head>
                <title>Contact Me</title>
                <meta name="viewport" content="width=device-width, initial-scale=1" />
            </Head>
            <Header header1="Contact Me" />

            <div class="main-content">
                <div id="projects-section">
                    <div className="content center">
                        <h1>Contact Me</h1>
                    </div>
                    <div id="Contact-Me" class="section">
                        <div className="center">
                            <div className="image-container">
                                <p id="message-status" name="message-status">&nbsp;</p>
                                <br></br>
                                <button onClick={handleSubmit}>Update DB</button>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </>
    );
}

export default Contact