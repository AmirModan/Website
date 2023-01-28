import Head from 'next/head'

function Game() {

    return (
        <>
            <Head>
                <title>Game</title>
                <meta name="viewport" />
            </Head>
            <header>
                <div class="content">
                    <a href="/" class="logo"><img src="/Images/Home-Icon.png" height="20" /></a>
                </div>
            </header>

            <div class="main-content">
                <div id="projects-section">
                    <div class="content center">
                        <h1><br></br></h1>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/phaser@3.16.2/dist/phaser.min.js"></script>
                    <script src="/src/Game/MainMenu.js"></script>
                    <script src="/src/Game/Level.js"></script>
                    <script src="/src/Game/game.js"></script>
                </div>


            </div>
        </>
    )
}

export default Game