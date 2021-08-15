/// <reference path="jquery-3.5.1.js" />
/// <reference path="jquery.validate.js" />


$.validator.addMethod("requireOne",

    function (value, element) {

        return $('input[type="checkbox"]:checked').size() > 0;

    },

    "Missing required status - Must choose one");

$.validator.setDefaults({ ignore: [] });

$.validator.setDefaults({

    debug: true,

    success: "data valid"

});;

$.validator.addMethod("requireOneMarital",
    function (value, element) {
        return $('input[type="radio"]:checked').size() > 0;
    },
    "Please tick at marital status");


$.validator.addMethod("selectNone",
    function (value, element) {
        if (element.value == "none") {
            return false;
        }
        else return true;
    },
    "Please select an option."
);



$(document).ready(function () {
    $("#form1").validate({
        focusInvalid: false,
        focusCleanup: true,
        debug: false,
        onkeyup: false,
        onclick: true,
        onsubmit: true,
        onkeyup: false,

        rules: {

            txtUserName: {
                required: true,
                minlength: 5
            },

            txtFirstName: {
                required: true,
                minlength: 1
            },

            txtLastName: {
                required: true,
                minlength: 1
            },

            txtEmail: {
                required: true,
                email: true
            },

            txtPassword: {
                required: true,
                minlength: 6,
                rangelength: [6, 10]
            },

            txtConfirmPassword: {
                required: true,
                minlength: 6,
                rangelength: [6, 10],
                equalTo: "#txtPassword"
            },

            //txtWebsite: {
            //    required: true,
            //    url: true
            //},

            //txtAge: {
            //    required: true,
            //    digits: true,
            //    range: [20, 25]
            //},

            //txtCalendar: {
            //    required: true,
            //    rangelength: [10, 10],
            //    date: true
            //},

            txtPhonenumber: {
                required: true,
                digits: true,
                minlength: 10,
                maxlength: 10
            },

            txtAddress: {
                required: true
            },

            txtCity: {
                required: true
            },

            txtZip: {
                required: true,
                digits: true,
                minlength: 6
            },
            txtDateOfBirth: {
                required: true,
                rangelength: [10, 10],
                date: true
            },

            //hiddenOptionValidator: {
            //    requireOne: true
            //},
            //hiddenRadioValidator: {
            //    requireOne: true
            //},

            hiddenOptionValidatorrbtnMarried: {
                requireOneMarital: true
            },
            ddlState: {
                selectNone: true
            },
            submitHandler: function (form) {
                form.submit();
            }

        },
        messages: {
            txtUserName: {
                required: "Please enter name",
                 minlength: "Your user name is too short. Must be at least {0} characters."
            },

            txtFirstName: {
                required: "Please enter First Name",
                minlength: "Your user name is too short. Must be at least {0} characters."
            },

            txtLastName: {
                required: "Please Enter Lat Name",
                minlength: "Your user name is too short. Must be at least {0} characters."
            },

            txtEmail: {
                required: "Please enter Email address"
            },

            txtPassword: {
                required: "Please enter password",
                minlength: "A minimum of {0} digits are required.",
                rangelength: "Password should be between {0} and {1} characters long"
            },

            txtConfirmPassword: {
                required: "Please re-enter password to confirm",
                minlength: "A minimum of {0} digits are required.",
                rangelength: "Password should be between {0} and {1} characters long"
            },
            //txtWebsite: {
            //    required: "Please enter valid website URL"
            //},
            //txtAge: {
            //    required: "Please enter age",
            //    digits: "Only digits accepted",
            //    range: "Age should be between {0} and {1}"
            //},

            //txtCalendar: {
            //    required: "Please enter date of birth",
            //    rangelength: "Enter valid date format(mm/dd/yyyy)"
            //},

            txtPhonenumber: {
                required: "Please enter mobile no",
                digits: "Only digits accepted",
                minlength: "A minimum of {0} digits are required.",
                maxlength: "A maximum of {0} digits are required."
            },

            hiddenOptionValidator: {

                requireOne: "Please tick at least one hobby"

            },

            txtAddress: {
                required: "Please enter address"
            },

            txtCity: {
                required: "Please enter address"
            },

            txtZip: {
                required: "Please enter zipcode",
                digits: "Only digits accepted",
                minlength: "A minimum of {0} digits are required."
            },
            txtDateOfBirth: {
                required: "Please enter date of Join",
                rangelength: "Enter valid date format(mm/dd/yyyy)"
            },
            hiddenOptionValidatorrbtnMarried: {
                requireOneMarital: "Please select marital status"
            },
            ddlState: {
                required: "Please select an option from the list, if none are appropriate please select 'Other'",
            }
        }
    });

    $("input[type='checkbox']").click(function () {

        $("#hiddenOptionValidator").valid();

    });
    $("input[type='radio']").click(function () {
        $("#hiddenOptionValidatorrbtnMarried").valid();
    });
});