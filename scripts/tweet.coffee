module.exports = (robot) ->

  robot.hear /修論/i, (msg) ->
    msg.send "ダメです"
