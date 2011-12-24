description "message.return", ->
    scenario "reply to left", ->
      given "an .object", ->
        @diag = $.uml ".sequence-diagram"
        @diag.found "A-rp-0", ->
          @message "b", "B-rp-1", ->
            @message "c", "C-rp-2", ->
              @reply "", "A-rp-3"
      when_it "compose", ->
        diag.appendTo $ "body"
        diag.compose()
      then_it "width", ->
        diag.find(".return:eq(0)").offset().left
            .shouldBe diag.find(".occurrence:eq(0)").offset().left
    
    scenario "reply to right", ->
      given "an .object", ->
        @diag = $.uml ".sequence-diagram"
        @diag.found "A-rp-4", ->
          @message "b", "B-rp-5", ->
            @message "c", "C-rp-6", ->
              @message "a", "A-rp-7", ->
                @reply "", "B-rp-8"
      when_it "compose", ->
        diag.appendTo $ "body"
        diag.compose()
      then_it "width", ->
        diag.find(".return:eq(0)").outerRight()
            .shouldBe diag.find(".occurrence:eq(1)").offset().left

    scenario "reply to right 2", ->
      given "an .object", ->
        @diag = $.uml ".sequence-diagram"
        @diag.found "A-rp-9", ->
          @message "b", "B-rp-10", ->
            @reply "back"
      when_it "compose", ->
        diag.appendTo $ "body"
        diag.compose()
      then_it "width", ->
