class CategoryController < ApplicationController
    # skip_before_action :verify_authenticity_token
    # skip_before_action :require_login, only:[:create,:show,:delete]
    before_action :authorize_request, except: [:show, :create, :delete,:articlecategory]
    def create
        category=Category.create(name: params[:name]);
    end
    def show
        category=Category.all;
        render json: category
    end
    def delete
        category=Category.find_by(id: params[:id])
        if(category!=nil)
        category.destroy
        render json: category
        else
        render html: 'Nhi hai bhai'  
        end
    end   
    def articlecategory
       category=Category.find_by(id: params[:id]);
       if(category==nil)
       render json: {error: "No such atricle exists"}
       else
        temp=category.id
        connection=Connecttable.where(category_id: temp)
        if(connection.length==0)
        render json: "No article of this category"
        else
         n=connection.length
         finalarticle=[]
         for i in 1..n
           tempid=connection[i-1].article_id;
           article=Article.find_by(id: tempid);
           if(article!=nil)
           finalarticle.push(article);
           end
         end  
         render json: finalarticle   
        end 
       end
    end     
end
