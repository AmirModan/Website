class Level extends Phaser.Scene {
    constructor(key) {
      super({key});
      this.levelKey = key
      this.nextLevel = {
        'Level1': 'Level2',
        'Level2': 'Level3',
        'Level3': 'Level4',
        'Level4': 'MainMenu',
        
      }
      this.lastLevel = {
        'Level2': 'Level1',
        'Level3': 'Level2',
        'Level4': 'Level3',
        
      }
    }
  
    preload() {
      this.load.image('Dwayne', './Resources/Images/Enemy.png');
      this.load.image('Platform', './Resources/Images/Platform.png');
      this.load.image('RainDrop', './Resources/Images/Raindrop.png');
      this.load.spritesheet('Asad', './Resources/Images/Player.png', {frameWidth: 197, frameHeight: 154});

    }
  
    create() {
      gameState.active = true;

      gameState.bgColor = this.add.rectangle(0, 0, config.width, config.height, 0x000000).setOrigin(0, 0);
      gameState.player = this.physics.add.sprite(150, 200, 'Asad').setScale(.3);
      gameState.player.setCollideWorldBounds(true);
      this.physics.world.setBounds(-100, 0, gameState.bgColor.width + gameState.player.width, gameState.bgColor.height + gameState.player.height);
      this.cameras.main.setBounds(0, 0, gameState.bgColor.width, gameState.bgColor.height);
      this.cameras.main.startFollow(gameState.player);
      gameState.platforms = this.physics.add.staticGroup();

      this.createAnimations();
      this.levelSetup();
      this.createRain();
      this.createStars();
      this.physics.add.collider(gameState.player, gameState.platforms);
  
      gameState.cursors = this.input.keyboard.createCursorKeys();
      
    }

    createAnimations() {
      this.anims.create({
        key: 'idle',
        frames: this.anims.generateFrameNumbers('Asad', { start: 0, end: 0 }),
        frameRate: 5,
        repeat: -1
      });
      this.anims.create({
        key: 'run',
        frames: this.anims.generateFrameNumbers('Asad', { start: 1, end: 2 }),
        frameRate: 5,
        repeat: -1
      });
      this.anims.create({
        key: 'jump',
        frames: this.anims.generateFrameNumbers('Asad', { start: 3, end: 3 }),
        frameRate: 5,
        repeat: -1
      });
    }

    createSurface(surface) {
      const xIndex = surface[0];
      const yIndex = surface[1];
      const Length = surface[2];
      const Height = surface[3];

        for(let i = 0; i < Length; i++) {
            for(let j = 0; j < Height; j++){
                gameState.platforms.create(xIndex + (100 * i), yIndex + (100 * j), 'Platform').setOrigin(0, 0).refreshBody();
            }
        }
    }

    createEnemy(enemy) {
      const xIndex = enemy[0];
      const yIndex = enemy[1];
      const domain = enemy[2];
      const type = enemy[3];
      if(type === 'grunt') {
        gameState.grunt = this.physics.add.sprite(xIndex, yIndex, 'Dwayne').setScale(.3);
        this.physics.add.overlap(gameState.player, gameState.grunt, () => {
          this.physics.pause
          this.cameras.main.shake(240, .01, false, function(camera, progress) {
            if(progress > .9){
              this.scene.restart(this.levelKey);
            }
          });
        });
      }
      this.physics.add.collider(gameState.grunt, gameState.platforms);
      gameState.grunt.move = this.tweens.add({
        targets: gameState.grunt,
        x: domain + xIndex,
        ease: 'Linear',
        duration: domain * 7,
        repeat: -1,
        yoyo: true
      });
    }

    createRain() {
      gameState.rain = this.add.particles('RainDrop');
      gameState.emitter = gameState.rain.createEmitter({
        x: { min: 0, max: config.width * 2 },
        y: -10,
        lifespan: 2000,
        speedX: { min: -5, max: -200 },
        speedY: { min: 600, max: 800 },
        scale: { start: 1, end: 0 },
        quantity: 10,
        blendMode: 'ADD'
      });
      gameState.emitter.setScrollFactor(0);
      this.physics.add.collider(gameState.rain, gameState.platforms);
    }

    createStars() {
      gameState.stars = [];
      function getStarPoints() {
        const color = 0xffffff;
        return {
          x: Math.floor(Math.random() * config.width),
          y: Math.floor(Math.random() * config.height * 0.5),
          radius: Math.floor(Math.random() * 3),
          color,

        }
      }
      for(let i = 0; i < 200; i++) {
        const { x, y, radius, color} = getStarPoints();
        const star = this.add.circle(x, y, radius, color);
        star.setScrollFactor(Math.random() * 0.1);
        gameState.stars.push(star);
      }

      if(this.weather === 'night') {
        gameState.stars.forEach(star => star.setVisible(true));
      } else {
        gameState.stars.forEach(star => star.setVisible(false));
      }
    }

    levelSetup() {
      for(let i = 0; i < this.surfaces.length; i++) {
        this.createSurface(this.surfaces[i]);
      }

      for(let i = 0; i < this.enemies.length; i++) {
        this.createEnemy(this.enemies[i]);
      }

      this.setWeather(this.weather);
    }

    setWeather(weather) {
      const weathers = {
        'morning': {
          'color': '0xecdccc',
          'rain': 1,
          'wind': 20,
          'bgColor': 0xF8c3aC
        },
        'afternoon': {
          'color': '0xffffff',
          'rain': 1,
          'wind': 80,
          'bgColor': 0x0571FF
        },
        'twilight': {
          'color': '0xccaacc',
          'rain': 10,
          'wind': 200,
          'bgColor': 0x18235C
        },
        'night': {
          'color': '0x555555',
          'rain': 1,
          'wind': 20,
          'bgColor': 0x000000
        },
      }
      let { color, rain, wind, bgColor } = weathers[weather];
      gameState.bgColor.fillColor = bgColor;
      gameState.player.setTint(color);
      if (gameState.emitter) {
        gameState.emitter.setQuantity(rain);
        gameState.emitter.setSpeedX(-wind);
      }
    }
  
    update() {
      if(gameState.active){
        if(gameState.cursors.right.isDown && gameState.cursors.left.isDown) {
            gameState.player.setVelocityX(0);
            gameState.player.anims.play('idle', true);
        } else if(gameState.cursors.right.isDown) {
            gameState.player.setVelocityX(250);
            gameState.player.flipX = false;
            gameState.player.anims.play('run', true);
        } else if(gameState.cursors.left.isDown) {
            gameState.player.setVelocityX(-250);
            gameState.player.flipX = true;
            gameState.player.anims.play('run', true);
        } else {
            gameState.player.setVelocityX(0);
            gameState.player.anims.play('idle', true);
        }
        if (Phaser.Input.Keyboard.JustDown(gameState.cursors.space) && gameState.player.body.touching.down) {
          gameState.player.setVelocityY(-500);
          gameState.player.anims.play('jump', true);
        }

        if (!gameState.player.body.touching.down) {
          gameState.player.anims.play('jump', true);
        }
  
        if(gameState.player.y > gameState.bgColor.height) {
          this.cameras.main.shake(240, .01, false, function(camera, progress) {
            if(progress > .9){
              this.scene.restart(this.levelKey);
            }
          });
        }

        if(gameState.player.x > gameState.bgColor.width) {
          this.cameras.main.fade(1000, 0, 0, 0, false, function(camera, progress) {
            this.physics.pause();
            if(progress > .9) {
              this.scene.stop(this.levelKey);
              this.scene.start(this.nextLevel[this.levelKey]);
            }
          });
        }

        if(gameState.player.x < 0 && this.levelKey != 'Level1') {
          this.cameras.main.fade(1000, 0, 0, 0, false, function(camera, progress) {
            this.physics.pause();
            if(progress > .9) {
              this.scene.stop(this.levelKey);
              this.scene.start(this.lastLevel[this.levelKey]);
            }
          });
        }
      }
    }
  }
  
  class Level1 extends Level {
    constructor() {
      super('Level1');
      this.surfaces = [[0, 300, 10, 1], [0, 100, 1, 2]];
      this.enemies = [[500, 200, 300, 'grunt']];
      this.weather = 'twilight';
    }
  }
  
  class Level2 extends Level {
    constructor() {
      super('Level2');
      this.surfaces = [[100, 300, 4, 1], [600, 200, 3, 3]];
      this.enemies = [[400, 200, 100, 'grunt']];
      this.weather = 'night';

    }
  }
  
  class Level3 extends Level {
    constructor() {
      super('Level3');
      this.surfaces = [[100, 300, 4, 1], [200, 200, 1, 1], [600, 400, 3, 1]];
      this.enemies = [[400, 200, 300, 'grunt']];
      this.weather = 'afternoon';
    }
  }

  class Level4 extends Level {
    constructor() {
      super('Level4');
      this.surfaces = [[100, 300, 8, 1]];
      this.enemies = [[500, 200, 200, 'grunt']];
      this.weather = 'morning';
    }
  }