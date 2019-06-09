var productModel=require('../models/product.model');
module.exports=(req,res,next)=>{
    productModel.Top10baiviet().then(rows=>
        {
            res.locals.lcTop10baiviettime = rows;
            next();
        });
}