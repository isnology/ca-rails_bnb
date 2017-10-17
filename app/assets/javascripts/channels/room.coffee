window.App.Channels ||= {}
window.App.Channels.Room ||= {}

App.Channels.Room.subscribe = (roomName) ->
  App.cable.subscriptions.create {channel: "RoomChannel", room: roomName},
    connected: ->
# Called when the subscription is ready for use on the server

    disconnected: ->
# Called when the subscription has been terminated by the server

    received: (data) ->
      unless data.message.blank?
        $('#messages-table').append data.message
        scroll_bottom()

$(document).on 'turbolinks:load', ->
  return unless $(".messages.index").length > 0
  App.Channels.Room.subscribe($('body').data('room-name'))
  submit_message()
  scroll_bottom()

submit_message = () ->
  $('#message_content').on 'keydown', (event) ->
    if event.keyCode is 13 && !event.shiftKey
      $('input').click()
      event.target.value = ""
      event.preventDefault()

scroll_bottom = () ->
  $('#messages').scrollTop($('#messages')[0].scrollHeight)