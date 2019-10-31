const gameState = {
  speed: 240,
  ups: 380,
};
const config = {
    type: Phaser.AUTO,
    width: 1000,
    height: 500,
    backgroundColor: 0xA1C6CC,
    fps: {target: 60},
    physics: {
        default: 'arcade',
        arcade: {
            gravity: { y: 800 },
            enableBody: true,
        }
    },
    scene: [MainMenu, Level1, Level2, Level3, Level4],
};

const game = new Phaser.Game(config);