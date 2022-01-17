//hàm validator
function Validator(option){

    var selectorRules={};

    // hàm kiểm tra
    function Validate(inputElement, rule){
        // var errorMessaage = rule.test(inputElement.value);
        var errorElement = inputElement.parentElement.querySelector(option.errorSelector);
        var errorMessaage;

        //Lấy ra các rule của selector
        var rules = selectorRules[rule.selector];
        //Lập qua từng rule & kiểm tra
        // Nếu có lỗi thì dừng việc kiểm tra
        for(var i=0 ; i < rules.length; ++i)
        {
            errorMessaage = rules[i](inputElement.value);
            if(errorMessaage) break;
        }
        
        if(errorMessaage)
        {
            errorElement.innerText = errorMessaage;
            inputElement.parentElement.classList.add('invalid');
        }
        else
        {
            errorElement.innerText = '';
            inputElement.parentElement.classList.remove('invalid');
        }
        return !errorMessaage;
    }

    //lấy element của form cần validate
    var formElement = document.querySelector(option.form);
    if(formElement)
    {
       
        formElement.onsubmit = function(e){
            // Tắt chức năng submit form
        //    e.preventDefault();          
        
           var isFormValid = true;
           // Tiến hành validate khi submit
           option.rule.forEach(function (rule){
               var inputElement = formElement.querySelector(rule.selector);
               var isValid =  Validate(inputElement,rule);
               if(!isValid){
                   isFormValid = false;
               }
           });
           if(!isFormValid)
           {
             e.preventDefault();    
           }           
        //    if(isFormValid){
        //        if(typeof option.onSubmit === 'function'){
        //            var enableInput = formElement.querySelectorAll('[name]');
        //            var formValues = Array.from(enableInput).reduce(function(value,input){
        //                return (value[input.name] = input.value) && value;
        //            },{})
        //            option.onSubmit(formValues);
        //        }
        //     }
       }

        // Lặp qua rule và xử lý (Lắng nghe blur, input, ...)
        option.rule.forEach(function (rule){
            //lưu lại các rule cho mỗi input
            if(Array.isArray(selectorRules[rule.selector]))
            {
                selectorRules[rule.selector].push(rule.test);                
            } else
            {
                selectorRules[rule.selector] = [rule.test];
            }
            

            var inputElement = formElement.querySelector(rule.selector);            
            if(inputElement)
            {
                // Xử lý trường hợp blur khỏi input
                inputElement.onblur = function(){
                    Validate(inputElement,rule);                                         
                }

                //Xử lý mỗi khi người dùng nhập vào input
                inputElement.oninput = function(){
                    var errorElement = inputElement.parentElement.querySelector(option.errorSelector);
                    errorElement.innerText = '';
                    inputElement.parentElement.classList.remove('invalid');
                }
            }
        });       
    }
    
}

//Dịnh nghĩa rules
Validator.isRequired = function(selector,name){
    return{
        selector:selector,
        test: function (value) {
            return value.trim() ? undefined : `Vui lòng nhập ${name} `
        }
    }
}
Validator.isEmail = function(selector){
    return{
        selector:selector,
        test: function (value) {
            var regex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            return regex.test(value) ? undefined : 'Email không hợp lệ';
        }
    }
}
Validator.Sdt = function(selector,min,){
    return{
        selector:selector,
        test: function(value){
            return value.length >= min ? undefined : `SĐT phải dài hơn ${min} ký tự`;            
        }
    }
}
Validator.minLength = function(selector,min){
    return{
        selector:selector,
        test: function(value){
            return value.length >= min ? undefined : `Mật khẩu phải dài hơn ${min} ký tự`;            
        }
    }
}
Validator.isPasswordConfirm = function(selector, getConfirmValue){
    return{
        selector:selector,
        test: function(value){
            return value === getConfirmValue() ? undefined : 'Mật khẩu không trùng khớp'
        }
    }
}

