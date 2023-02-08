class LikeController < ApplicationController
    before_action :authorize_request ,except: [:create]
    skip_before_action :verify_authenticity_token
    def create
    
        article=Article.find_by(id: params[:id]);
        if(article!=nil)
        if(article.nooflike==nil)
        article.update(nooflike: 1)
        else
        temp=article.nooflike+1;
        article.update(nooflike: temp)
        end
        render json: article
        else
        render html: 'No such user exist'      
        end
    end
end
