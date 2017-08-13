$(document).ready(function () {  
    $('.btnSua').click(function () {
        var wz = $('#wizard');
        wz.smartWizard('goToStep', 1);
        wz.smartWizard('enableFinish', false);
        $('#wizard').find('input').val('');
        $('#modalSach').modal('show')
    })
})
    
    // khởi tạo select
   
function init() {

    $('#form').parsley();
    // Smart Wizard

    $('#wizard').smartWizard({
        onLeaveStep: leaveAStepCallback,
        selected: 0,
        onFinish: onFinishCallback
    });

    function leaveAStepCallback(obj, context) {
        var ISvalid = true;
        if (context.fromStep < context.toStep) {
            ISvalid = validateSteps(context.fromStep);
        }
        return ISvalid
    }

    function onFinishCallback(objs, context) {
        if (validateAllSteps()) {
            {
                $(".btn-submit").click();
                $('#modalSach').modal('hide')
            }
        }
    }
    //lấy data từ form

    // Your Step validation logic
    function validateSteps(stepnumber) {
        var isStepValid = true;
        $('.frmmain').parsley().validate("step" + stepnumber);
        if ($('.frmmain').parsley().isValid("step" + stepnumber)) {
            isStepValid = true;
        } else {
            isStepValid = false;
        }
        return isStepValid;
    }
    function validateAllSteps() {
        var isStepValid = true;
        $('.frmmain').parsley().validate();
        if ($('.frmmain').parsley().isValid()) {
            isStepValid = true;
        } else {
            isStepValid = false;
        }
        return isStepValid;
    }
}
$(document).ready(function () {
    // Smart Wizard
    $('#wizard_verticle').smartWizard({
        transitionEffect: 'slide'
    });
});