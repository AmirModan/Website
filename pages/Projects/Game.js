import Head from 'next/head'
import { useRouter } from 'next/router'
import Header from '../../public/components/Header'

function Game() {

    const router = useRouter()

    return (
        <>
            <Head>
                <title>Game</title>
                <meta name="viewport" content="width=device-width, initial-scale=1" />
            </Head>

            <Header/>

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