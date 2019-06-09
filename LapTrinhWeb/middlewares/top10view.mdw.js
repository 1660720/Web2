var productModel=require('../models/product.model');
module.exports=(req,res,next)=>{
    productModel.Top10view().then(rows=>
        {
            res.locals.lcTop10view = rows;
            next();
        });
}