$(document).ready ->
    nonce = 1
    $('.parallax').scrolly({bgParallax: true})
    append_to_form = ->
        $('#form-append').append('<div class="team-member"><p>Team Member ' + (if nonce is 1 then (nonce + ' (You)') else nonce) + '<br><div class="form-group">
                <input type="text" id="name" class="form-control" placeholder="Full Name" required="">
              </div>
              <div class="form-group">
                <input type="text" class="form-control" id="year" placeholder="Year/Grade" required="">
              </div>
              <div class="form-group">
                <input type="text" class="form-control" id="major" placeholder="Field(s) of study" required="">
              </div>
              <div class="form-group">
                <input type="email" class="form-control" id="email" placeholder="Email" required="">
              </div>
              <div class="form-group">
                <textarea type="text" id="comments" class="form-control" rows="5" placeholder="Relevant links - LinkedIn, Github, resume, past projects, or anything else that will help us make a decision."></textarea>
              </div></div>')
        nonce += 1
        $("html, body").animate({ scrollTop: $(document).height() }, 500)
    append_to_form()
    $('#add-team-member').click ->
        append_to_form()
        if nonce > 4
            $('#add-team-member').remove()

    $('#submit').click ->
        team_data = []
        $('.team-member').each (index)->
            team_member =
                name : $(this).find('#name').val()
                year : $(this).find('#year').val()
                major : $(this).find('#major').val()
                email : $(this).find('#email').val()
                comments : $(this).find('#comments').val()
            team_data.push team_member
        app_data = 
            team_data : team_data
            description: $('#description').val()
            goals : $('#goals').val()
            currect_stage : $('#current-stage').val()
        console.log JSON.stringify(app_data)
        $.post "/apps", app_data, (result)->
            if result.error
                $.notify('Error submitting application', 'error')
            else
                $.notify('Application successful - thanks!', 'success') 
                $('input').val('')
                $('textarea').val('')
