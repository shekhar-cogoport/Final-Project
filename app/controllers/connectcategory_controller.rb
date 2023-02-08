class ConnectcategoryController < ApplicationController
   def index
    category=Category.find_by(name: params[:name]);
    if(category==nil)
    render json: {errors: "No such category exist"} 
    else
       connectedarticle=[]
       articleid=Connecttable.where(category_id: params[:id])
       n=articleid.length;
       for i in 1..n
        temp=articleid[i-1].article_id;
        temparticle=Article.find_by(id: temp);
        connectedarticle.push(temparticle)
        # connectedarticle.push(temp)
       end 
       render json: connectedarticle;
    end   
   end
end
