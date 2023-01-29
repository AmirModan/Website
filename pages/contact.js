import Head from 'next/head'

function Contact() {

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
                        <div className="images-container">
                            <div className="subscribe-form-container">
                                <form onSubmit={handleSubmit}>
                                    <label htmlFor="name">Name</label>
                                    <input type="text" id="name" name="name" required />
                                    <label htmlFor="email">Email</label>
                                    <input type="text" id="email" name="email" required />
                                    <button type="submit">Subscribe</button>
                                </form>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </>
    );
}

async function handleSubmit(event) {
    event.preventDefault();
    //call to the Netlify Function you created
    await fetch(".netlify/functions/sendEmail", {
        method: "POST",
        body: JSON.stringify({
            subscriberName: document.getElementById("name").value,
            subscriberEmail: document.getElementById("email").value,
            inviteeEmail: "amir5modan@gmail.com",
        }),
    });
}

export default Contact