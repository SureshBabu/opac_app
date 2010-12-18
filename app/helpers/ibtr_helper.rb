module IbtrHelper
  def membership_info(cardId)
    if cardId then
      membership = Membership.find_by_card_id(cardId)
      "##{membership.card_id}: #{membership.member}: #{membership.plan}"
    else
      "#Not Available: Not Available: Not Availble"
    end
  end
  
  def image_url(titleId)
    if titleId then
      "http://justbooksclc.com/images/titles/#{titleId}.jpg"
    else
      "#"
    end
  end  
end
