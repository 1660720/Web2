var productModel=require('../models/product.model');
module.exports=(req,res,next)=>{
    productModel.Top10chuyenmuc().then(rows=>
        {
            res.locals.lcTop10chuyenmuc = rows;
            next();
        });
}