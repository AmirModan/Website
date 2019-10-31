class MainMenu extends Phaser.Scene {
    constructor() {
        super({ key: 'MainMenu' });
    }

    preload() {
        this.load.image('startBox', './Resources/Images/StartBox.png');
    }

    create() {
        gameState.startBox = this.add.image(config.width/2, 100, 'startBox');
        gameState.startBox.setInteractive();
        gameState.startBox.on('pointerover', function() {
            this.setScale(1.05);
        });
        gameState.startBox.on('pointerout', function() {
            this.setScale(1);
        });
        gameState.startBox.on('pointerup', () => {
            this.scene.stop('MainMenu');
            this.scene.start('Level1');
        });
        
    }
}