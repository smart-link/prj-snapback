#########################################
# Settings
#########################################
BlazeLayout.setRoot 'body'

#########################################
# RootGroup
#########################################
RootGroup = FlowRouter.group {}

RootGroup.route '/',
  name: 'index'
  action: (params, queryParams) ->
    BlazeLayout.render 'layout', main: 'index'

