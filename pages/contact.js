import Head from 'next/head'

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
            throw new Error(`HTTP error! status: ${response.status}`);
        } else {
            const form = document.getElementById("contact-form");
            form.reset();
        }
    }

    return (
        <>
            <Head>
                <title>Contact Me</title>
                <meta name="viewport" />
            </Head>
            <header>
                <div className="content">
                    <a href="/" className="logo"><img src="/Images/Home-Icon.png" height="20" /></a>
                    <nav className="desktop">
                        <a href="Contact-Me">Contact Me</a>
                    </nav>
                    <nav className="mobile">
                        <a href="Contact-Me">Contact Me</a>
                    </nav>
                </div>
            </header>
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
                                    <br></br><br></br>
                                    <label htmlFor="message">Message *</label>
                                    <br></br>
                                    <textarea id="message" name="message" rows="4" cols="50" required></textarea>
                                    <br></br>
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