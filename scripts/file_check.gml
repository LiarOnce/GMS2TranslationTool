///file_check();

if (!updatecheck) { //Check the local version and web version to determine if there is an update or not
    //Read version.txt
    if file_exists(localpath) { //Check to see if the file exists
        var version; //Set a temporary variable
        version = file_text_open_read(localpath); //Open the file
        localversion = file_text_read_string(version); //Read the file
        file_text_close(version); //Closes the file - This Is Important!!
    }
    
    //Read version.txt from the web
    if file_exists(webtemp) { //Check to see if the file exists
        var webversion; //Set a temporary variable
        webversion = file_text_open_read(webtemp); //Open the file
        releaseversion = file_text_read_string(webversion); //Read the file
        file_text_close(webversion); //Closes the file - This Is Important!!
    }
    
    //Check and save the patch notes
    if file_exists(patchlocal) { //Check to see if the file exists
        var notes; //Set a temporary variable
        notes = file_text_open_read(patchlocal); //Open the file
        patchnotes = file_text_read_string(notes); //Read the file
        file_text_close(notes); //Closes the file - This Is Important!!
    }
    
    if (file_exists(localpath)) && (file_exists(webtemp)) {
        updatecheck = true;
        //Compare both version.txt files
        if (localversion != releaseversion) {
           drawUpdate = true;
           //If the versions do not match, draw the update message
           //If there is an update available, you can choose to tell the user to visit your website to
           //download the update, or you can use the same method above and include *zip_unzip* to
           //download a zip file with your updated files and unzip them and go from there
        } else {
           drawUpdate = false; //If both versions match, don't draw the update message
        }
    }
}
