var productModel=require('../models/product.model');
module.exports=(req,res,next)=>{
    productModel.show().then(rows=>
        {
            res.locals.lcshow = rows;
            next();
        });
}