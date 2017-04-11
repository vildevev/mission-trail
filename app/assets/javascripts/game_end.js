
var game = new Phaser.Game(800, 600, Phaser.CANVAS, 'phaser-example', { preload: preload, create: create, render: render });

function preload() {

    game.load.audio('boden', song);

}

var music;

function create() {

    game.stage.backgroundColor = '#182d3b';
    game.input.touch.preventDefault = false;

    music = game.add.audio('boden');
    music.onDecoded.add(start, this);
}

function start() {

    music.fadeIn(4000);

}

function render() {
    game.debug.soundInfo(music, 20, 32);
}
