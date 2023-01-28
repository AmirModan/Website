import Head from 'next/head'

function CNNGestureRecognition() {

    return (
        <>
            <Head>
                <title>CNN Gesture Recognition</title>
                <meta name="viewport" />
            </Head>
            <header>
                <div class="content">
                    <a href="/" class="logo"><img src="/Images/Home-Icon.png" height="20" /></a>
                    <nav class="desktop">
                        <a href="#GestureRecognition">Gesture Recognition with CNN</a>
                    </nav>
                    <nav class="mobile">
                        <a href="#GestureRecognition">Gesture Recognition with CNN</a>
                    </nav>
                </div>
            </header>

            <div class="main-content">
                <div id="projects-section">
                    <div id="GestureRecognition" class="project">
                        <h2>Gesture Recognition with CNN</h2>
                        <div class="images-container">
                            <div class="image-container">
                                <img src="/Images/GestureRecognition.png" />
                            </div>
                        </div>

                        <div class="images-container">
                            <div class="image-container">
                                <p>The Neural-Machine Interface we will design will be capable of detecting the user’s intent based on muscle
                                    activity from within their arm. The Myo Armband will be used as a wearable and wireless alternative to
                                    standard lab equipment which will be responsible for measuring this physical activity in the form of Surface
                                    Electromyography (EMG) signals.</p>
                                <p>The Myo Armband will then digitize this data and send it to a computer which will act as the central device
                                    in our system.</p>
                                <p>A Convolutional Neural Network (CNN) will be responsible for classifying raw EMG signals into one of a set
                                    of gestures based on Supervised Learning.</p>
                                <p>While using Neural Networks can be much more costly than standard machine learning algorithms in terms of
                                    computation, they may prove to boost performance when it comes to classifying large and complex data such as
                                    the data we intend to receive from the Myo Armband.</p>
                                <p>The computer will also provide a Graphical User Interface so that the final product will be usable.</p>
                            </div>
                        </div>
                        <div class="doc-container">
                            <object data="/src/CNNGestureRecognition/engr845_FinalReport_Modan_Botejue.pdf"
                                type="application/pdf" frameborder="0" width="100%" height="600px">
                                <embed src="https://drive.google.com/file/d/1F3MXhXv23PFQG56xL-Jgu9hKc_Cni-lJ/preview?usp=sharing"
                                    width="100%" height="600px" />
                            </object>
                        </div>
                        <div class="center">
                            <div class="images-container">
                                <div class="image-container">
                                </div>
                                <div class="image-container">
                                    <h3>Source Code</h3>
                                    <p><a href="/src/CNNGestureRecognition/CNN.py">CNN.py</a></p>
                                    <p><a href="/src/CNNGestureRecognition/DataRetrieval.py">DataRetrieval.py</a></p>
                                    <p><a href="/src/CNNGestureRecognition/Dataset.py">Dataset.py</a></p>
                                    <p><a href="/src/CNNGestureRecognition/gui.py">gui.py</a></p>
                                    <p><a href="/src/CNNGestureRecognition/main.py">main.py</a></p>
                                </div>
                                <div class="image-container">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </>
    )
}

export default CNNGestureRecognition