$(document).ready ->
    nonce = 1
    $('.parallax').scrolly({bgParallax: true})
    append_to_form = ->
        $('#form-append').append('<div class="team-member"><p>Team Member ' + nonce + '<br><div class="form-group">
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
        submission_data = []
        $('.team-member').each (index)->
            team_member = {}
            team_member.name = $(this).find('#name').val()
            team_member.year = $(this).find('#year').val()
            team_member.major = $(this).find('#major').val()
            team_member.email = $(this).find('#email').val()
            team_member.comments = $(this).find('#comments').val()
            submission_data.push team_member
        console.log submission_data
        $.notify('Thanks for applying!', 'success') 

    # save=function(){
    #     console.log("foo");
    #     var name=$('#name').val();
    #     var year=$('#year').val();
    #     var major=$('#major').val();
    #     var email=$('#email').val();
    #     var comments=$('#comments').val();
    #     emailsRef.push(email);
    #     var hey=myRootRef.push();
    #     hey.set({name:name,email:email, year:year, major:major,comments:comments}, function(error){
    #         if (error){
    #             console.log("bad");
    #                         }
    #                         else{
    #                              $.notify( 'Thank you for signing up!', "success");
    #                              $("form")[0].reset();
    #                         }

    #     });
#     #}
#     $('#pennapps-mentor-submit').click(save);
# })