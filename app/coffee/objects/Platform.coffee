class Platform extends Phaser.Sprite
  constructor: (@game, x, y, key, frame) ->
    super @game, x, y, key, frame

    @game.physics.p2.enable @
    @body.kinematic = yes

    @body.setMaterial @game.platformMaterial
    @body.setCollisionGroup @game.cg.platform
    @body.collides @game.cg.player

    console.log @body.data.shapes[0]

    @setupMotion()

class HorizontalPlatform extends Platform
  setupMotion: ->
    @body.velocity.x = 50

    @game.time.events.loop Phaser.Timer.SECOND*5, (-> @body.velocity.x = @game.physics.p2.mpxi(@body.velocity.x*-1)), @
    #@game.add.tween @body
    # .to {x: '+100'}, 2000, Phaser.Easing.Linear.None
    # .to {x: '-100'}, 2000, Phaser.Easing.Linear.None
    # .yoyo()
    # .loop()
    # .start()

class VerticalPlatform extends Platform
  setupMotion: ->
    @body.velocity.y = 50

    #@game.time.events.loop Phaser.Timer.SECOND*5, (-> @body.velocity.x = @game.physics.p2.mpxi(@body.velocity.x*-1)), @
    @game.add.tween @body
    .to {y: '+100'}, 2000, Phaser.Easing.Linear.None
    .to {y: '-100'}, 2000, Phaser.Easing.Linear.None
    .yoyo()
    .loop()
    .start()

window.HorizontalPlatform = HorizontalPlatform
window.VerticalPlatform = VerticalPlatform