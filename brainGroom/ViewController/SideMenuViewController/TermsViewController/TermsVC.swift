//
//  TermsVC.swift
//  brainGroom
//
//  Created by Satya Mahesh on 12/08/17.
//  Copyright © 2017 Mahesh. All rights reserved.
//

import UIKit

class TermsVC: UIViewController
{

    
    @IBOutlet weak var txtView: UITextView!
    @IBOutlet weak var headerViewHeightConstraint: NSLayoutConstraint!
    var fromSocial = Bool()
    var isFaq : Bool = false
    @IBAction func backBtnAction(_ sender: Any)
    {
        _=self.navigationController?.popViewController(animated:true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if fromSocial == true
        {
            headerViewHeightConstraint.constant = 55
        }
        else
        {
            headerViewHeightConstraint.constant = 0
        }

        // Do any additional setup after loading the view.
        
        if isFaq == true
        {
            let startHtml : String = "<!DOCTYPE html><html><body>"
            let title1Html : String = "<font size=\"6\" color=\"#0C3763\"><center><b>For Vendor's</b></center></font><br>"
            let header1Html : String = "<font size=\"6\" color=\"#3877B2\">General</font><br><br>"
            let quest1 : String = "<font size=\"4\" color=\"#000000\"><b><span style=\"background-color: #F4F3F4\">Q: What is BrainGroom?</span></b></font><br><font size=\"4\" color=\"#000000\">It is an online marketplace for educational, recreational & wellness classes with defined target segment, quantifiable outcomes & specified time duration. Braingroom Portal & app helps users find & book all types of education & lifestyle classes in and around them in few clicks. Class listing is completely free in braingroom.com. We also provide free marketing and promotions for every client.</font><br><br>"
            let quest2 : String = "<font size=\"4\" color=\"#000000\"><b><span style=\"background-color: #F4F3F4\">Q: What are the benefits of posting classes/Workshops/activities in BrainGroom?</span></b></font><br><font size=\"4\" color=\"#000000\">Posting your classes/workshops/activities in BrainGroom helps your visibility in and around the city. We provide free publicity through all the social medias and also a free video and photo shoot to promote your classes/workshops/activities.</font><br><br>"
            
            let header2Html : String = "<font size=\"6\" color=\"#3877B2\">Registration</font><br><br>"
            let quest3 : String = "<font size=\"4\" color=\"#000000\"><b><span style=\"background-color: #F4F3F4\">Q: Why do I need to register in BrainGroom?</span></b></font><br><font size=\"4\" color=\"#000000\">You will have the access to post your own classes/workshops/activities for free in BrainGroom. You will also be able to book your favourite classes/workshops/activities sessions.</font><br><br>"
            let quest4 : String = "<font size=\"4\" color=\"#000000\"><b><span style=\"background-color: #F4F3F4\">Q: Is there any fee for registration?</span></b></font><br><font size=\"4\" color=\"#000000\">No. Registering in BrainGroom is free</font><br><br>"
            let quest5 : String = "<font size=\"4\" color=\"#000000\"><b><span style=\"background-color: #F4F3F4\">Q: What is 'Identity verified vendor' and 'Credential verified vendor' in BrainGroom?</span></b></font><br><font size=\"4\" color=\"#000000\">Identity verified vendor will have an identity verified logo in the respective profile. To become an Identity verified vendor, upload any two of the identity proof (Aadhar card, Licence, Passport, academy registration certificate (only for academy) & PAN card) in your profile and send the attested copy of your Identity proof to BrainGroom office. Credential verified vendor will have a credential verified logo in the respective profile. To become a Credential verified vendor, upload any one of your credential proof (Certification of Teacher, Experience Certificate & any certificate related to the professional experience).</font><br><br>"
            let quest6 : String = "<font size=\"4\" color=\"#000000\"><b><span style=\"background-color: #F4F3F4\">Q: What is the advantage of being a verified vendor?</span></b></font><br><font size=\"4\" color=\"#000000\">Verified logo in the class/workshop/activity provider's profile will be given first preference in the class listing page for any users.</font><br><br>"
            
            let header3Html : String = "<font size=\"6\" color=\"#3877B2\">User Profile</font><br><br>"
            let quest7 : String = "<font size=\"4\" color=\"#000000\"><b><span style=\"background-color: #F4F3F4\">Q: How to post a class/workshop/activity in BrainGroom?</span></b></font><br><font size=\"4\" color=\"#000000\">To post a class/workshop/activity, you should be registered in BrainGroom. If you are a registered member, log in to your profile and click on 'Post a Class' in your dashboard and post the respective class. Once BrainGroom admin verify your class, it will be posted in the portal/app.</font><br><br>"
            let quest8 : String = "<font size=\"4\" color=\"#000000\"><b><span style=\"background-color: #F4F3F4\">Q: How many classes can I post in BrainGroom for free?</span></b></font><br><font size=\"4\" color=\"#000000\">You can post unlimited number classes in BrainGroom for free.</font><br><br>"
            let quest9 : String = "<font size=\"4\" color=\"#000000\"><b><span style=\"background-color: #F4F3F4\">Q: Can I remove/edit my class/workshop/activity details after posting in BrainGroom?</span></b></font><br><font size=\"4\" color=\"#000000\">No, once you have posted the class, you cannot edit/delete the class/workshop/activity details till the validity of the class/workshop/activity gets over. If you want to edit/delete your class/workshop/activity, you can contact BrainGroom help desk and inform.</font><br><br>"
            let quest10 : String = "<font size=\"4\" color=\"#000000\"><b><span style=\"background-color: #F4F3F4\">Q: How to get my classes in 'Featured Classes List' in home page and category page?</span></b></font><br><font size=\"4\" color=\"#000000\">Select 'Promote your Class' and choose your required days to promote your classes. Payments for home page & category page featured listings will be different and will change from time to time based on demand. Vendors should check the details thoroughly before booking.</font><br><br>"
            let quest11 : String = "<font size=\"4\" color=\"#000000\"><b><span style=\"background-color: #F4F3F4\">Q: What is 'Catalogue' in BrainGroom? And How to list my class/workshop/activity in catalogue?</span></b></font><br><font size=\"4\" color=\"#000000\">BrainGroom Catalogue is the B2B feature which helps Schools, Colleges, Corporate, Clubs, Residential Communities and Parties to organize an event (workshops/classes/activities) at their location within few clicks. To list your class/workshop/activity, click on 'Add to Catalogue' in your Dashboard and select the respective class/activity/workshop to be added. After Admin verification, it will get posted in the Catalogue list.</font><br><br>"
            let quest12 : String = "<font size=\"4\" color=\"#000000\"><b><span style=\"background-color: #F4F3F4\">Q: How do I get notified if anyone books my class?</span></b></font><br><font size=\"4\" color=\"#000000\">For mobile application users, a push notification will be sent if there is any booking. Web users will get a notification in their respective BrainGroom dashboard for booking details.</font><br><br>"
            
            
            let title2Html : String = "<font size=\"6\" color=\"#0C3763\"><center><b>For Learner's</b></center></font><br>"
            let header4Html : String = "<font size=\"6\" color=\"#3877B2\">General</font><br><br>"
            let quest13 : String = "<font size=\"4\" color=\"#000000\"><b><span style=\"background-color: #F4F3F4\">Q: Will I get refund if I cancel a booked ticket?</span></b></font><br><font size=\"4\" color=\"#000000\">No, ticket cannot be refunded once you book it. Only if a vendor cancels the class, ticket can be refunded.</font><br><br>"
            let quest14 : String = "<font size=\"4\" color=\"#000000\"><b><span style=\"background-color: #F4F3F4\">Q: Does the validity of a class/workshop/activity ticket can be extended if required?</span></b></font><br><font size=\"4\" color=\"#000000\">No, it cannot be extended. Validity of the ticket is fixed according the class/workshop/activity provider's availability.</font><br><br>"
            let quest15 : String = "<font size=\"4\" color=\"#000000\"><b><span style=\"background-color: #F4F3F4\">Q: What are the payment modes available in BrainGroom?</span></b></font><br><font size=\"4\" color=\"#000000\">BrainGroom uses the most secured payment modes available in the country. PayUmoney and Razorpay are the two payment methods integrated in BrainGroom.</font><br><br>"
            let quest16 : String = "<font size=\"4\" color=\"#000000\"><b><span style=\"background-color: #F4F3F4\">Q: What is a Flexible & Fixed class/workshop/activity?</span></b></font><br><font size=\"4\" color=\"#000000\">Flexible class/workshop/activity can be attended at your flexible timings or venue. For Fixed class/workshop/activity, timing and venue will be pre decided by the respective provider.</font><br><br>"
            let quest17 : String = "<font size=\"4\" color=\"#000000\"><b><span style=\"background-color: #F4F3F4\">Q: How to find the nearest class/workshop/activity?</span></b></font><br><font size=\"4\" color=\"#000000\">BrainGroom uses the map search where you can find the nearest class in the 'Explore' page.</font><br><br>"
            
            let header5Html : String = "<font size=\"6\" color=\"#3877B2\">Gift a Class</font><br><br>"
            let quest18 : String = "<font size=\"4\" color=\"#000000\"><b><span style=\"background-color: #F4F3F4\">Q: What are the options available in Gifting a Class/workshop/activity?</span></b></font><br><font size=\"4\" color=\"#000000\">BrainGroom provides three different Gifting options, you can Gift to an individual, you can gift your employees and you can Gift to an NGO.</font><br><br>"
            let quest19 : String = "<font size=\"4\" color=\"#000000\"><b><span style=\"background-color: #F4F3F4\">Q: What is the refund procedure for Gift coupons?</span></b></font><br><font size=\"4\" color=\"#000000\">Gift coupons cannot be refunded.</font><br><br>"
            
            let header6Html : String = "<font size=\"6\" color=\"#3877B2\">Catalogue Class</font><br><br>"
            let quest20 : String = "<font size=\"4\" color=\"#000000\"><b><span style=\"background-color: #F4F3F4\">Q: What is a catalogue class?</span></b></font><br><font size=\"4\" color=\"#000000\">BrainGroom Catalogue is the B2B feature which helps Schools, Colleges, Corporate, Clubs, Residential Communities and Parties to organize an event (workshops/classes/activities) at their location within few clicks. To list your class/workshop/activity, click on 'Add to Catalogue' in your Dashboard and select the respective class/activity/workshop to be added. After Admin verification, it will get posted in the Catalogue list.</font><br><br>"
            let quest21 : String = "<font size=\"4\" color=\"#000000\"><b><span style=\"background-color: #F4F3F4\">Q: How to book a catalogue class/workshop/webinar/activity?</span></b></font><br><font size=\"4\" color=\"#000000\">Click on the 'Get Quote' option on a respective class/workshop/webinar/activity, the quotation will be mailed to your registered mail address.</font><br><br>"
            
            let header7Html : String = "<font size=\"6\" color=\"#3877B2\">Connect</font><br><br>"
            let quest22 : String = "<font size=\"4\" color=\"#000000\"><b><span style=\"background-color: #F4F3F4\">Q: What is 'Connect' in BrainGroom?</span></b></font><br><font size=\"4\" color=\"#000000\">'Connect' is BrainGroom's discussion forum, which helps connecting people through their post and blogs. You can post your blogs and articles in the connect part only if you are a registered member.</font><br><br>"
            let quest23 : String = "<font size=\"4\" color=\"#000000\"><b><span style=\"background-color: #F4F3F4\">Q: Will I be able to write blogs in Connect as a learner?</span></b></font><br><font size=\"4\" color=\"#000000\">No, you cannot write blog as a learner. But, you can switch to vendor tab in dashboard and write blogs and articles.</font><br><br>"
            let quest24 : String = "<font size=\"4\" color=\"#000000\"><b><span style=\"background-color: #F4F3F4\">Q: How to report any action against blog or post?</span></b></font><br><font size=\"4\" color=\"#000000\">If you find any articles or blogs are hateful, obscene and revengeful posts/comments with “spam” you can click the 'Report' option below the respective blog/activity and within 48 hours BrainGroom will take an action if necessary.</font><br><br>"
            
            let finalHtml : String = "</body></html>"
            
            let htmlStr : String = startHtml + title1Html + header1Html + quest1 + quest2 + header2Html + quest3 + quest4 + quest5 + quest6 + header3Html + quest7 + quest8 + quest9 + quest10 + quest11 + quest12 + title2Html + header4Html + quest13 + quest14 + quest15 + quest16 + quest17 + header5Html + quest18 + quest19 + header6Html + quest20 + quest21 + header7Html + quest22 + quest23 + quest24 + finalHtml
            
            txtView.setHTML(html: htmlStr)
        }
        else
        {
            let startHtml : String = "<!DOCTYPE html><html><body>"
            let titleHtml : String = "<font size=\"6\" color=\"#0C3763\"><center><b>TERMS & CONDITIONS</b></center></font><br><br>"
            let headerHtml : String = "<font size=\"6\" color=\"#3877B2\">Description of Service</font><br><br>"
            let desc1 : String = "<font size=\"5\" color=\"#3877B2\">Class Type (Fixed/Flexible) and Booking related:</font><br><font size=\"4\" color=\"#000000\"><ul type=\"disc\"><li>Listing classes in braingroom.com is free. Anyone can browse, choose, book and pay for classes through braingroom.com</li><li>For successful bookings, a Booking Confirmation email will be sent to your designated email address and a booking success SMS will be sent to your registered mobile number.</li><li>Braingroom has three types of class posts – Normal (Fixed & Flexible Classes) and Catalogue Classes.</li></ul></font><br>"
            let desc2 : String = "<font size=\"5\" color=\"#3877B2\">Fixed classes</font><br><font size=\"4\" color=\"#000000\"><ul type=\"disc\"><li>These type of classes will have fixed timing, date & place.</li><li>Fixed classes once booked cannot be cancelled by the user.</li><li>Fixed classes cannot be posted before one month from the date of its commencement. And it will be valid / live only till the last occurrence of the class.</li></ul></font><br>"
            let desc3 : String = "<font size=\"5\" color=\"#3877B2\">Flexible class</font><br><font size=\"4\" color=\"#000000\"><ul type=\"disc\"><li>For these type of classes, after booking, users can call vendors and fix the class at a mutually convenient time & place.</li><li>As per the policy, vendor should start a flexible class within one month from the class booking date.</li><li>Flexible classes will be valid (or live in Braingroom) from “Class validity date-from” to “Class validity date – to”. This time period cannot be more than 6 months.</li></ul></font><br>"
            let desc4 : String = "<font size=\"5\" color=\"#3877B2\">Catalogue Class Listings related</font><br><font size=\"4\" color=\"#000000\"><ul type=\"disc\"><li>Many renowned tutors & experienced academies post their classes in braingroom.com's catalogue area for institutional booking (bulk booking) alone. Price for these catalogue classes will be discussed and decided by tutor/academy and organizer (Braingroom user) through series of queries mediated by Braingroom admin.</li><li>For the service of coordinating catalogue classes, Braingroom collects a 15% commission on total class fees paid by the organizer to the tutor/academy.</li></ul></font><br>"
            let desc5 : String = "<font size=\"5\" color=\"#3877B2\">Class Gift Coupons & Gift Cards related</font><br><font size=\"4\" color=\"#000000\"><ul type=\"disc\"><li>Specific classes can be gifted as Gift cards or Gift coupons with specific denomination through Braingroom.</li><li>All Gift Coupons and Gift Cards for individuals and corporates will be sent on the same date or on the chosen date, whichever has been chosen by the user. Intimation for the same will be sent through both mail and SMS.</li><li>Gift classes to NGOs will give the user the option to choose the NGO & segment (under which a micro class will be conducted at that NGO) to send a Gift. Admin will moderate the proceedings for this between user and NGO.</li><li>For “Gift for NGO” case, admin will finalize the vendor & class, based on the location and vendor availability. Admin will try to make it on a mutually convenient date where user can also attend it but still it is not a mandate as vendor availability will be given more priority than the user chosen date.</li><li>Gift Coupon id should be redeemed within 2 months of gift receiving date. After which coupon will get invalid & money associated with it will be transferred to BrainGroom.</li><li>Specific fixed or flexible classes gifted under “Gift Cards” will also come under corresponding fixed / flexible rules and terms & conditions as mentioned above</li></ul></font><br>"
            let desc6 : String = "<font size=\"5\" color=\"#3877B2\">Class Quality & Guarantee related</font><br><font size=\"4\" color=\"#000000\"><ul type=\"disc\"><li>We provide all class related information in the description area & vendor related information in the profile area. So it is the user's responsibility to choose the right class and refunds are only applicable in the case of tutor/academy cancelling the class in the beginning or in the middle of the class.</li><li>Braingroom is not responsible for the quality of content offered by the vendor as we do only profile check and are not responsible for the training materials / content provided by the vendor to user</li><li>Braingroom guarantees the credibility of profile information provided only by the “registered & verified” vendors. For other unverified vendors, we are not responsible for the credibility of the details provided in their profile information.</li><li>Reviews are to be filled by the users after they attend a class, booked through Braingroom.</li><li>Reviews are purely the opinion of the users and Braingroom will not force or manipulate the users to provide specific views.</li><li>Braingroom shall also not be responsible for any of the reviews or comments made by the users.</li></ul></font><br>"
            
            let header2Html : String = "<br><br><font size=\"6\" color=\"#3877B2\">Payments, Cancellation and Refunds:</font><br><br>"
            
            let desc7 : String = "<font size=\"5\" color=\"#3877B2\">Pricing related</font><br><font size=\"4\" color=\"#000000\"><ul type=\"disc\"><li>Braingroom.com collects a 10% commission of the listing price for each class sold.</li><li>For the service of coordinating catalogue classes, Braingroom collects a 15% commission on total class fees paid by the organizer to the tutor/academy.</li><li>Classes listed on Braingroom which are also listed on your own website or through third-party providers (other e-commerce sites) should be priced uniformly. This is to prevent price discrimination to Braingroom users.</li><li>For the purpose of marketing and acquiring user base Braingroom reserves all rights to reduce the price of the classes. But this reduction will be done only by compensating Braingroom's commission and will not affect the vendor in their pricing.</li><li>The vendors might enter a partnership agreement to provide the Braingroom users with special prices.</li><li>For flexible classes, it is the tutor/academy's responsibility to enter the class start code & end code to ensure the class progress is getting tracked in the system for payment processing. Only after getting the end code, the payment will be processed</li><li>If vendor fails to enter these codes, the money will be with Braingroom and vendor has one month to re-enter the code / call Braingroom to provide code & process payment, failing which the vendors lose their right to claim the money.</li></ul></font><br>"
            
            let desc8 : String = "<font size=\"5\" color=\"#3877B2\">Payment Processing related</font><br><font size=\"4\" color=\"#000000\"><ul type=\"disc\"><li>Within 3 working days after the fixed / flexible class completion, the tutors’ / coaching institutes (vendors) will receive a sales summary via email.</li><li>Payment happens in three cycles in a month at Braingroom. It will happen on every 10th, 20th & 30th of a month. During these cycles, Braingroom will make payment to your designated bank account via Internet Banking.</li><li>All classes completed between 28th of previous month & 7th of current month will be paid on 10th of current month;</li><li>All classes completed between 8th & 17th of every month will be paid on 20th of that month;</li><li>All classes completed between 18th & 27th of every month will be paid on 30th of that month</li><li>Classes happening between 8th to 10th, 18th to 20th and 28th to 30th of every month will be processed in the next cycle only.</li><li>As a Braingroom partner, you can offer special vendor rates to Braingroom to stand out in the crowd.</li><li>Discounts related to Group Classes & Bulk bookings are provided solely by the vendor and not by BrainGroom. Hence BrainGroom will not be responsible for any issue arising based on this.</li></ul></font><br>"
            
            let desc9 : String = "<font size=\"5\" color=\"#3877B2\">Vendor Initiated Cancellations</font><br><font size=\"4\" color=\"#000000\"><ul type=\"disc\"><li>Please ensure that a minimum of 2 days’ advance notice is given to attendees who have booked the cancelled class</li><li>tutor/ academy, when you cancel 3 classes in a row, your account will be first temporarily withdrawn and a review will be conducted for further listing of classes. If there is a credibility issue, Braingroom reserves the right to deactivate the vendor account from Braingroom.</li><li>vendors are purely responsible for ensuring that attendees are notified and aware of the cancellation.</li><li>vendor cancels a class without any notification to the user / BrainGroom then the user can either, choose to call / mail Braingroom & inform about the incident.</li><li>rnatively, the user can also inform about the class cancellation incident through the automatic feedback form sent to the user's registered mail id (sent the day after the class date)</li></ul></font><br>"
            
            let desc10 : String = "<font size=\"5\" color=\"#3877B2\">Customer Initiated Cancellations</font><br><font size=\"4\" color=\"#000000\"><ul type=\"disc\"><li>No refund for customer initiated cancellations.</li><li>A learner can try to reschedule a class by directly talking to vendor. Braingroom will not mediate this. But if the vendor is ready to reschedule it then we will make payment accordingly for flexible class & fixed classes (on actual / new class completion date).</li><li>Rescheduled classes should be notified to Braingroom before the user attends the class for ease of making payments.</li></ul></font><br>"
            
            let desc11 : String = "<font size=\"5\" color=\"#3877B2\">Refunds related</font><br><font size=\"4\" color=\"#000000\"><ul type=\"disc\"><li>Refund is possible only in the case where tutor/academy is cancelling the class before / in between or not conducting the classes for the mentioned time period.</li><li>If a vendor fails to start a flexible class within one month, then the learner is eligible for refund and vendor will be placed in the red list for further investigation.</li><li>If a vendor cancels three consecutive classes, then his account & associated email ids will be deactivated from braingroom.com, until further investigations are carried out and Braingroom reserves right to decide if the vendor account will be reactivated or otherwise.</li><li>Tutors & Academies should make sure the 10% (normal classes) & 15% (catalogue classes) commissions deducted from every BrainGroom class booking is from the listing price and is not over and above the listing price.</li><li>If a vendor fails to attend the fixed catalogue class without prior notice, then the learner is eligible for refund and investigation will be carried out to avoid such instances in the future.</li><li>If a vendor cancels three consecutive catalogue classes, then his account & associated email ids will be deactivated from braingroom.com until further investigation.</li></ul></font><br>"
            
            let desc12 : String = "<font size=\"5\" color=\"#3877B2\">Featured listing related</font><br><font size=\"4\" color=\"#000000\"><ul type=\"disc\"><li>Tutors/Academies can promote their Classes in featured list in home page & category page by making payments accordingly.</li><li>Payments for home page & category page featured listings will be different and will change from time to time based on demand so vendor should check that under “Promote Class” tab before booking.</li><li>Classes will be listed in featured lists through a bidding system. Slots will be allocated based on availability and first come first served basis.</li><li>For unsuccessful bids, money will be refunded in three to five days.</li></ul></font><br>"
            
            let desc13 : String = "<font size=\"5\" color=\"#3877B2\">Class Approvals & Rejections related</font><br><font size=\"4\" color=\"#000000\"><ul type=\"disc\"><li>Class postings, Adding class to Catalogue requests and Featured promote class requests – all these come under admin verification; Admin's decision will be final in all these cases.</li><li>Vendors can call our helpline and can ask the reason for their rejection to improve and repost. Still admin decision is final.</li><li>Vendors posting obscene & irrelevant class posts will be deactivated at once. Also class posts hurting sentiments of certain individuals / group of people will also be removed at once.</li><li>Vendors taking Braingroom's help to upload classes, should be aware that it is their responsibility to provide the right description, details & pictures. Braingroom cannot be responsible for any such mismatch in the information provided.</li><li>To avoid data mismatch, as a procedure once the class summary and details are written by BrainGroom (on behalf of vendors), we will send it to the vendor and the vendor needs to reply within 48hrs if there is any correction.</li><li>If there is no correction sent to Braingroom within 48 hours, then we will put it in the website and the full responsibility lies with the vendors. For corrections mailed within 48 hours, we will make those changes, get confirmation and then publish it in BrainGroom.</li></ul></font><br>"
            
            let desc14 : String = "<font size=\"5\" color=\"#3877B2\">Issue Resolution related</font><br><font size=\"4\" color=\"#000000\"><ul type=\"disc\"><li>Any issue raised on the vendor by user or the ones raised on the user by vendor will all be closed within thirty days.</li><li>All the issues related to class timing / attendance should be raised within 3 to 5 days of the occurrence. Issues raised after this time period will be considered null & void.</li><li>Only issues related to class timings, vendor / user attendance, discrepancy in vendor details provided in profile information (for verified vendors) will be accepted by BrainGroom helpdesk.</li><li>During the issue resolution, payment will be parked at BrainGroom account.</li></ul></font><br>"
            
            let desc15 : String = "<font size=\"5\" color=\"#3877B2\">Promocode / Offers related</font><br><font size=\"4\" color=\"#000000\"><ul type=\"disc\"><li>There is a maximum discount amount or the value per transaction with the promo codes on the total transaction amount, whichever is lower.</li><li>The discount code is valid only on Class Bookings and can be redeemed on Braingroom mobile app and website.</li><li>The offer is valid for a limited time period only!</li><li>Braingroom reserves the right to withdraw or modify this offer at any time and without prior notice. In case of any dispute, the decision of Braingroom will be final.</li><li>This offer cannot be combined with any other Offers/Coupons/Promotions at Braingroom.</li></ul></font><br>"
            
            let desc16 : String = "<font size=\"5\" color=\"#3877B2\">Connect Discussion Forums and Groups</font><br><font size=\"4\" color=\"#000000\"><ul type=\"disc\"><li>All ideas or opinions expressed in the discussion forum and group are subjected to user views & opinions and hence BrainGroom cannot be held responsible for the same. However, hateful, obscene and revengeful posts / comments with “spam” (highlights from other users) will be verified by admin & will be removed at once.</li><li>All blog articles posted by Vendors are their own responsibilities. We don’t support any of their claims or views mentioned in those articles</li><li>All meeting / activity requests posted by fellow users are based on their own initiatives / interests and BrainGroom has no hidden/direct interest in those. Hence any cancellation or changes with respect to activity requests will also be the specific users’ responsibility and not Braingroom's.</li><li>Spam content will be removed within at max 48 hours of issue highlights from the users.</li></ul></font><br>"
            
            let desc17 : String = "<font size=\"5\" color=\"#3877B2\">Marketing and Intellectual Property</font><br><font size=\"4\" color=\"#000000\"><ul type=\"disc\"><li>You grant permission to Braingroom to use material from your listed classes (copywriting, images, etc) for marketing purposes across various channels such as Search Engines and Social Media. This material still remains your Intellectual Property.</li><li>All materials posted under class description are vendor's responsibilities. So Braingroom will not take responsibility for any inconsistencies or misleading details in class information.</li><li>Braingroom will only take responsibility of details provided by Braingroom's “verified vendors”</li><li>To get verified by Braingroom, vendors should pay Rs. 5000 & get their information audited & verified by Braingroom executives and after successful completion of verification, vendors profile will have “Braingroom verified” symbol in their profiles.</li></ul></font><br>"
            
            let desc18 : String = "<font size=\"5\" color=\"#3877B2\">Videos and Photos</font><br><font size=\"4\" color=\"#000000\"><ul type=\"disc\"><li>Braingroom is offering photo shot on priority for preferred vendors & partners right now. Other interested vendors can raise a request for the same and BrainGroom will attend to it as per availability. However, this will come with an additional cost.</li><li>Braingroom has an upper limit for Photos & Videos (w.r.t both count & size) that a vendor can upload under his profile and under connect part. If a user exceeds this BrainGroom has the right to remove the most recently added photo / video without user permission.</li><li>Braingroom will request the vendors for a video and photo session. The decision to accept / reject the request solely depends on the vendor's.</li><li>Braingroom will have full rights over the photo and the video content taken by our in-house personnel and will use them solely for the purpose of marketing the vendor's classes through the website.</li><li>In the event the vendor does not provide access to Braingroom personnel or provide with any photo's Braingroom has all rights to use an appropriate photo that will closely relate to the type/category of the classes.</li><li>All photos used in the website are legally obtained through appropriate channels by Braingroom.</li><li>Braingroom will reserve all rights to reject any photo or video content provided by the vendor if the admin decides that it is not relevant to the class content.</li><li>Braingroom is using Google maps to map classes to their addresses. Any issue arising due to mismatch / inconsistency in location mapping will not be borne by BrainGroom as it is being generated by a Third party.</li></ul></font><br>"
            
            let desc19 : String = "<font size=\"5\" color=\"#3877B2\">Force Majeure</font><br><font size=\"4\" color=\"#000000\"><ul type=\"disc\"><li>For the purpose of this Agreement, an “Event of Force Majeure” means any circumstance not within the reasonable control of the Party affected, but only if and to the extent that (i) such circumstance, despite the exercise of reasonable diligence and the observance of Good Utility Practice, cannot be, or be caused to be, prevented, avoided or removed by such Party, and (ii) such circumstance materially and adversely affects the ability of the Party to perform its obligations under this Agreement, and such Party has taken all reasonable precautions, due care and reasonable alternative measures in order to avoid the effect of such event on the Party's ability to perform its obligations under this Agreement and to mitigate the consequences thereof.</li></ul></font><br>"
            
            let finalHtml : String = "</body></html>"
            let htmlStr : String = startHtml + titleHtml + headerHtml + desc1 + desc2 + desc3 + desc4 + desc5 + desc6 + header2Html + desc7 + desc8 + desc9 + desc10 + desc11 + desc12 + desc13 + desc14 + desc15 + desc16 + desc17 + desc18 + desc19 + finalHtml
            txtView.setHTML(html: htmlStr)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func backBtn(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)

    }
}

extension UITextView {
    func setHTML(html: String) {
        do {
            let at : NSAttributedString = try NSAttributedString(data: html.data(using: .utf8)!, options: [NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType], documentAttributes: nil);
            self.attributedText = at;
        } catch {
            self.text = html;
        }
    }
}

