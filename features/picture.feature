Feature: An authenticated user must be able add/edit his personal galleries

    Background:
      Given the following users are created in the database:
        | lastname | firstname | email                   | password      |
        | Cheng    | Fabrice   | fabrice.cheng@gmail.com | fabpassword   |
      Given I am logged in as "fabrice.cheng@gmail.com" with password "fabpassword"  
      Given I go to my profile page
      Given the following galleries are created in the database:
          | name                    | headline         | description    | avatar    | skill_name |
          | UltimateForecaster 2012 | Bet on Euro 2012 | UF 2012 is a betting web site created for UEFA Euro 2012. | reachjobs_gallery.png  | HTML |
      Given I go to my profile page    
      Given I press on "portfolio" tab
      

    @javascript
    Scenario: User adds one image to an existing image gallery (scenario which works)
      Given I press on my gallery avatar 
      Then I am redirected to my images gallery
        And I should see "ULTIMATEFORECASTER 2012" on my gallery page
        And I should see "Bet on Euro 2012" on my gallery page
        And I should see "UF 2012 is a betting web site created for UEFA Euro 2012." on my gallery page
        And I should see "HTML" on my gallery page
      Then I press on "Button_edit_gallery_images" image  
        And I am redirected to "Edit Gallery Images" page
        And I attach the file "Reachjobs01.png" to "picture_avatar" 
      When I press "Upload"
        And I wait for the ajax request to finish
        Then I should stay on "Edit Gallery Images" page
          And I should see the image "Reachjobs01"


    @javascript
    Scenario: User edits one existing image with another one (scenario which works)
      Given the following pictures are already added to "UltimateForecaster 2012" gallery
        | picture_file               |
        | existing_image_gallery.png |
      Given I press on my gallery avatar 
      Given I press on "Button_edit_gallery_images" image  
        And I should see the image "existing_image_gallery"
      Then I press "Edit" below my existing image and attach the file "Reachjobs01.png"
        And I wait for the ajax request to finish
        And I should stay on "Edit Gallery Images" page
          And I should see the image "Reachjobs01"
          And I should not see the image "existing_image_gallery" 


    @javascript
    Scenario: User deletes one existing image (scenario which works)
      Given the following pictures are already added to "UltimateForecaster 2012" gallery
        | picture_file               |
        | existing_image_gallery.png |
      Given I press on my gallery avatar 
      Given I press on "Button_edit_gallery_images" image  
        And I should see the image "existing_image_gallery"
      Given I press "Delete" within "gallery_list_images" section
        And I wait for the ajax request to finish
        And I should stay on "Edit Gallery Images" page
          And I should not see the image "existing_image_gallery" anymore  


    @javascript
    Scenario: User fails to add one image because wrong format type (error)
      Given I press on my gallery avatar 
      Then I am redirected to my images gallery
      Then I press on "Button_edit_gallery_images" image  
        And I am redirected to "Edit Gallery Images" page
        And I attach the file "wrong.bmp" to "picture_avatar" 
      When I press "Upload"
        And I wait for the ajax request to finish
        Then I should stay on "Edit Gallery Images" page
          And I should see "Image Upload failed." error message
          And I should not see the image "Reachjobs01"   


    @javascript
    Scenario: User fails edits one existing image with a wrong format image (error)
      Given the following pictures are already added to "UltimateForecaster 2012" gallery
        | picture_file               |
        | existing_image_gallery.png |
      Given I press on my gallery avatar 
      Given I press on "Button_edit_gallery_images" image  
        And I should see the image "existing_image_gallery"
      Then I press "Edit" below my existing image and attach the file "wrong.bmp"
        And I wait for the ajax request to finish
        Then I should stay on "Edit Gallery Images" page
          And I should not see the image "wrong"
          And I should see the image "existing_image_gallery"               