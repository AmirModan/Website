import Head from 'next/head'

function MyoHMI() {

    return (
        <>
            <Head>
                <title>MyoHMI</title>
                <meta name="viewport" />
            </Head>
            <header>
                <div class="content">
                    <a href="/" class="logo"><img src="/Images/Home-Icon.png" height="20" /></a>
                    <nav class="desktop">
                        <a href="#Defense">Defense</a>
                        <a href="#Thesis">Thesis</a>
                    </nav>
                    <nav class="mobile">
                        <a href="#Defense">Defense</a>
                        <a href="#Thesis">Thesis</a>
                    </nav>
                </div>
            </header>

            <div class="main-content">
                <div id="projects-section">
                    <div class="content center">
                        <h1>MyoHMI</h1>
                    </div>
                    <div id="MyoHMI" class="project">
                        <div id="Defense" class="images-container">
                            <div class="image-container">
                                <div class="center">
                                    <iframe src="https://www.youtube.com/embed/UfISkfoZ0jE" frameborder="1"
                                        allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                                </div>
                            </div>
                            <div class="text-container">
                                <p>Surface electromyographic (sEMG) signal is a bioelectric signal that measures muscle activities by surface
                                    electrodes placed on the skin and is effective for representing movement intentions. Myoelectric-controlled
                                    human-machine interfaces (HMIs) utilize sEMG signals from the user’s muscles to identify what the user is
                                    doing physically and can relay this action to control an output device such as a prosthetic limb or a
                                    gesture-controlled application. The aim of this project is to enhance a previously developed Android-based
                                    mobile computing platform named mMyoHMI, to provide a portable, low-cost, and flexible solution for sEMG
                                    pattern recognition-based myoelectric-controlled applications. The mMyoHMI platform seamlessly integrates a
                                    variety of interfacing and signal processing modules from data acquisition through pattern recognition to
                                    real-time evaluation and control. The enhanced MyoHMI app improves the input interface module to make it
                                    flexible to collect sEMG signals from many different types of sensors via Bluetooth Low Energy (BLE) and has
                                    made the first attempt to integrate deep learning methods on a mobile device for real-time sEMG pattern
                                    classification.
                                </p>
                            </div>
                        </div>
                        <div id="Thesis" class="doc-container">
                            <object data="/Documents/Research/AmirModan_918234621_ENGR_Thesis.pdf" type="application/pdf" frameborder="0"
                                width="100%" height="600px">
                                <embed src="https://drive.google.com/file/d/16M8crwlrKFKA6MSE2h9FxvXB8K7Ss69h/preview?usp=sharing"
                                    width="100%" height="600px" />
                            </object>
                        </div>
                    </div>
                </div>

            </div>
        </>
    )
}

export default MyoHMI