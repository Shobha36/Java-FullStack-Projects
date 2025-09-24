package com.mvc.sdb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.mvc.sdb.entity.ProfileUrl;
import com.mvc.sdb.service.ProfileService;

@Controller
public class ProfileController {

    @Autowired
    private ProfileService profileService;

    // Show all profiles for a student
    @RequestMapping(value = "/find-all-profiles", method = RequestMethod.GET)
    public ModelAndView findProfiles(@RequestParam("studentId") int studentId) {
        return profileService.findAllProfilesByStudentId(studentId);
    }

    //  Add new profile
    @RequestMapping(value = "/add-profile", method = RequestMethod.POST)
    public ModelAndView addNewProfile(@RequestParam("studentId") int studentId,
                                      @RequestParam("profileName") String profileName,
                                      @RequestParam("url") String url) {
        ProfileUrl profile = new ProfileUrl();
        profile.setProfileName(profileName);
        profile.setUrl(url);
        return profileService.addProfile(studentId, profile);
    }

    // Delete profile
    @RequestMapping(value = "/delete-by-id", method = RequestMethod.GET)
    public ModelAndView deleteProfile(@RequestParam("profileId") int profileId,
                                      @RequestParam("studentId") int studentId) {
        profileService.deleteProfile(profileId);
        // Redirect back to profile list
        return new ModelAndView("redirect:/find-all-profiles?studentId=" + studentId);
    }
    //update profile
    @RequestMapping(value = "/find-profile-by-id", method = RequestMethod.GET)
    public ModelAndView showUpdateForm(@RequestParam("profileId") int profileId,
                                       @RequestParam("studentId") int studentId) {
        ProfileUrl profile = profileService.getProfileById(profileId);
        ModelAndView mv = new ModelAndView("updateProfile.jsp");
        mv.addObject("profile", profile);
        mv.addObject("studentId", studentId);
        return mv;
    }

 

  // Update profile
    @RequestMapping(value = "/update-profile", method = RequestMethod.POST)
    public ModelAndView updateProfile(@RequestParam("profileId") int profileId,
                                      @RequestParam("studentId") int studentId,
                                      @RequestParam("profileName") String profileName,
                                      @RequestParam("url") String url) {
        ProfileUrl profile = new ProfileUrl();
        profile.setProfileId(profileId);
        profile.setProfileName(profileName);
        profile.setUrl(url);
        profileService.updateProfile(profile);
        // Redirect back to profile list
        return new ModelAndView("redirect:/find-all-profiles?studentId=" + studentId);
    }
}
