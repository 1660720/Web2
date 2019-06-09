var productModel=require('../models/product.model');
module.exports=(req,res,next)=>{
    productModel.Top4noibat().then(rows=>
        {
            res.locals.lcTop4noibat = rows;
            next();
        });
}