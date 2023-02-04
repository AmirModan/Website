import Head from 'next/head'
import Header from '../public/components/Header'

function Contact() {

    async function handleSubmit(event) {
        event.preventDefault();
        //call to the Netlify Function you created
        const response = await fetch(".netlify/functions/sendEmail", {
            method: "POST",
            body: JSON.stringify({
                message: document.getElementById("message").value,
                subscriberName: document.getElementById("name").value,
                subscriberEmail: "amir5modan@gmail.com",//document.getElementById("email").value,
                inviteeEmail: "amir5modan@gmail.com",
            }),
        });
        if (!response.ok) {
            const messageStatus = document.getElementById("message-status");
            messageStatus.innerText = "Message could not be sent. Please try again later";
            messageStatus.style.color = "red"
            //messageStatus.style.background = "white"
            //throw new Error(`HTTP error! status: ${response.status}`);
        } else {
            const form = document.getElementById("contact-form");
            form.reset();
            const messageStatus = document.getElementById("message-status");
            messageStatus.innerText = "Message was sent successfully!";
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
                            <div className="subscribe-form-container">
                                <form id="contact-form" name="contact-form" onSubmit={handleSubmit}>
                                    <label htmlFor="name">Name</label>
                                    <br></br>
                                    <textarea id="name" name="name" rows="1" cols="50" />
                                    <br></br><br></br><br></br>
                                    <label htmlFor="message">Message *</label>
                                    <br></br>
                                    <textarea id="message" name="message" rows="4" cols="50" required></textarea>
                                    <br></br>
                                    <p id="message-status" name="message-status">&nbsp;</p>
                                    <br></br>
                                    <button type="submit">Send Message</button>
                                </form>
                            </div>

                        </div>
                    </div>

                </div>
            </div>

        </>
    );
}

export default Contact