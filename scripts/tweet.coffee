# Description:
#   shuron is NOT OK.
#
# Commands:
#   修論 - Hubot replies "修論ダメです"

random_int = (num) ->
  Math.floor(Math.random()*num)

attach = (body, ch, num) ->
  return body if ch.length <= 0 or num < 1
  for i in [1..num]
    pos = random_int(body.length)
    body = ch + body if pos == 0
    body = [body[0..(pos-1)], ch, body[pos..body.length]].join "" if pos > 0
  return body

space = "‌‌"

module.exports = (robot) ->

  robot.respond /修論/i, (msg) ->
    robot.logger.info "Respond #{msg.serialize}"
    text = "修論ダメです"
    temp = text
    for i in [1..10]
      temp = text if temp.length >= 140
      try
        msg.reply attach(temp, space, random_int(70-temp.length/2))
        break
      catch err
        continue

