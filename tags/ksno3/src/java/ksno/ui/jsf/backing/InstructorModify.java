/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.model.SelectItem;
import ksno.model.Article;
import ksno.model.Category;
import ksno.model.Image;
import ksno.model.Instructor;
import ksno.model.Person;
import ksno.service.ArticleService;
import ksno.service.ImageService;
import ksno.service.PersonService;
import ksno.util.ImageMeta;
import ksno.util.JSFUtil;
import org.apache.myfaces.component.html.ext.HtmlInputText;
import org.apache.myfaces.component.html.ext.HtmlInputTextarea;
import org.apache.myfaces.component.html.ext.HtmlOutputText;
import org.apache.myfaces.component.html.ext.HtmlSelectOneMenu;
import org.apache.myfaces.custom.fileupload.UploadedFile;

/**
 *
 * @author halsnehauge
 */
public class InstructorModify {
    private HtmlInputTextarea txtAreaAboutMe;
    private HtmlInputText firstName;
    private HtmlInputText lastName;
    private HtmlInputText account;
    private HtmlInputTextarea aboutMe;
    private HtmlOutputText upPortraitResult;
    private HtmlOutputText errorMsg;   
    private UploadedFile upPortrait;
    private ksno.model.Instructor instructor;

    // <editor-fold defaultstate="collapsed" desc=" getters and setters">
    public HtmlInputTextarea getTxtAreaAboutMe() {
        return txtAreaAboutMe;
    }

    public void setTxtAreaAboutMe(HtmlInputTextarea txtAreaAboutMe) {
        this.txtAreaAboutMe = txtAreaAboutMe;
    }

    public ksno.model.Instructor getInstructor() {
        if(instructor == null){
            String userName = JSFUtil.getRequest().getUserPrincipal().getName();
            Person person = personService.getPerson(userName);
            instructor = personService.getInstructor(person.getId());
        }
        return instructor;
    }

    public HtmlInputTextarea getAboutMe() {
        return aboutMe;
    }

    public void setAboutMe(HtmlInputTextarea aboutMe) {
        this.aboutMe = aboutMe;
    }

    public HtmlInputText getAccount() {
        return account;
    }

    public void setAccount(HtmlInputText account) {
        this.account = account;
    }

    public HtmlOutputText getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(HtmlOutputText errorMsg) {
        this.errorMsg = errorMsg;
    }

    public HtmlInputText getFirstName() {
        return firstName;
    }

    public void setFirstName(HtmlInputText firstName) {
        this.firstName = firstName;
    }

    public ImageService getImageService() {
        return imageService;
    }

    public void setImageService(ImageService imageService) {
        this.imageService = imageService;
    }

    public HtmlInputText getLastName() {
        return lastName;
    }

    public void setLastName(HtmlInputText lastName) {
        this.lastName = lastName;
    }

    public PersonService getPersonService() {
        return personService;
    }

    public void setPersonService(PersonService personService) {
        this.personService = personService;
    }

    public UploadedFile getUpPortrait() {
        return upPortrait;
    }

    public void setUpPortrait(UploadedFile upPortrait) {
        this.upPortrait = upPortrait;
    }

    public HtmlOutputText getUpPortraitResult() {
        return upPortraitResult;
    }

    public void setUpPortraitResult(HtmlOutputText upPortraitResult) {
        this.upPortraitResult = upPortraitResult;
    }
    PersonService personService;
    ImageService imageService;

    private Logger getLogService(){
        return Logger.getLogger(Instructor.class.getName());
    }

    public String getCurrentPortrait(){
        String userName = JSFUtil.getRequest().getUserPrincipal().getName();
        Person person = personService.getPerson(userName);
        ksno.model.Instructor instructor = personService.getInstructor(person.getId());
        return instructor.getProfilePicture();

    }
    // </editor-fold>
    
    
    public String store(){
        getLogService().log(Level.INFO,"About to update instructor profile");
        String returnVal = "success";
        try{
            Instructor ins = getInstructor();
            try{
                HashMap<ImageMeta,String> imageSize = imageService.uploadImage(getUpPortrait().getInputStream(), ins.getUserName());
                Image image = new Image();
                image.setOwner(ins);
                image.setName(imageSize.get(ImageMeta.sizeMAX));
                image.setUrl(imageSize.get(ImageMeta.url));
                ins.setProfilePicture(imageSize.get(ImageMeta.sizeMIN));
            }catch(NullPointerException e){};
            ksno.model.Text aboutMe = new ksno.model.Text();
            aboutMe.setAuthor(ins);
            aboutMe.setBody(getTxtAreaAboutMe().getValue().toString());
            aboutMe.setName("Instructor"+ins.getFirstName()+"shortText");
            aboutMe.setSubject("Short text for instructor " +  ins.getFirstName());
            aboutMe.setCreatedDate(new Date());
            aboutMe.setLastUpdatedDate(new Date());
            getLogService().log(Level.INFO, "Storing instructor profile data: Text" + aboutMe.getBody());
            ins.setAboutMe(aboutMe);
            personService.updatePerson(ins);
            
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to update instructor person", e);
            errorMsg.setValue("Dine profildata ble ikke endret, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());
            returnVal = "no";
        }
        return returnVal;
    }   
    

}
