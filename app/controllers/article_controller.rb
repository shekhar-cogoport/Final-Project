class ArticleController < ApplicationController
    skip_before_action :verify_authenticity_token
    # skip_before_action :require_login, only:[:create,:show]
    before_action :authorize_request, except: [:show, :index, :explicit]
    def new
    end
    def create
        if(@current_user==nil)
            render json: {errors: "User not Authorized"}
        else
            name=@current_user.name
            article=@current_user.articles.new(title: params[:title],text: params[:text],description: params[:description],author_name: name,category_ids: params[:category_id])
            const=article.save
            if const==true
            render json: article 
            else
            render json:{ errors: "Article is not saving" }   
            end
        end
    end
    def show
        article=Article.all
        consarticle=[];
        n=article.length()
        # puts n
        for i in 1..n
        temp=article[i-1].id;
        category=Connecttable.where(article_id: temp)
        finalcatecory=[]
        m=category.length
        for j in 1..m
          tempid=category[j-1].category_id;
          tempcategory=Category.find_by(id: tempid)
          if(tempcategory!=nil)
          finalcatecory.push(tempcategory)
          end
        end
        const={articledetail: article[i-1],categorydetails: finalcatecory};
        consarticle.push(const)
        end   
        render json: consarticle
    end
    def explicit
        article=Article.find_by(id: params[:id]);
        if(article==nil)
         render json: {error: "You are not allowed to open this article"}   
        else
           id=article.id;
           temptable=Connecttable.where(article_id: params[:id])
           n=temptable.length();
           namearray=[]
           for i in 1..n
            presid=temptable[i-1].category_id;
            category=Category.find_by(id: presid);
            namearray.push(category);
           end   
           render json: {body: article,category: namearray}
        end
    end            
    def delete
        article=Article.find_by(id: params[:id])
        if(@current_user==nil)
        render html: "User not authorized"
        elsif(@current_user.id.to_i!=article.author_id.to_i)    
         render json: {error: "You are not authorized to delete this page"}
        else
         article.destroy
         render json: article
        end          
    end  
    def update
        article=Article.find_by(id: params[:id])
         if(@current_user==nil)
         render html: "User not authorized"
         elsif(@current_user.id.to_i!=article.author_id.to_i)    
         render json: {error: "You are not authorized to update this page"}
         else
         if(author.update(params.require(:author).permit(:name, :description, :email,:newpass)))
         render html: 'perfectly edited'
         else
         render json: { errors: author.errors.full_messages },
         status: :unprocessable_entity
         end
    end

end
end












