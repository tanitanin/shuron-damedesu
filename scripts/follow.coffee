# Description:
#   Refollow users
#

module.exports = (robot) ->

#  robot.respond /フォローして/g, (msg) ->
#    # フォローしてないユーザのデータは取得できないらしい...?
#    # msg.user が undefined になってる
#    robot.logger.info "Follow requested by #{msg.user}"
#    robot.adapter.join msg.user

#  robot.respond /フォローやめて/g, (msg) ->
#    robot.logger.info "Unfollow requested by #{msg.user.name}"
#    robot.adapter.part msg.user

  robot.on 'followed', (event) ->
    robot.logger.info "Followed by #{event.user.name}"
    robot.adapter.join event.user

#  robot.on 'unfollowed', (event) ->
#    robot.logger.info "Unfollowed by #{event.user.name}"
#    robot.adapter.part event.user

