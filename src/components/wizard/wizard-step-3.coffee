React = require 'react'
dom = React.DOM
{Filters} = require '../filters/filters'
Immutable = require 'immutable'

Step = React.createClass
  render: ->
    opts =
      dimensions:
        @props?.data?.get('structure')?.get('dimensions').get('series') ?
          Immutable.List([])
      series: @props?.data?.get('dataSets')?.get(0).get('series') ?
        Immutable.Map({})
      name: @props?.data?.get('structure')?.get('name')
      error: @props.error
      busy: @props.busy
      hierarchies: @props.hierarchies

    dom.div {className: 'step-pane sample-pane', 'data-step': '3'},
      React.createElement Filters, opts

  shouldComponentUpdate: (nextProps, nextState) ->
    nextProps.step is 3

Step.propTypes =
  data: React.PropTypes.instanceOf(Immutable.Map).isRequired
  step: React.PropTypes.number.isRequired
  error: React.PropTypes.object.isRequired
  busy: React.PropTypes.bool.isRequired
  hierarchies: React.PropTypes.object.isRequired

exports.WizardStepThree = Step
