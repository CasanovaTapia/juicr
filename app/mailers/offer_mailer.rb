class OfferMailer < ActionMailer::Base
  default from: "casanovatapia@gmail.com"

  def new_offer(user, ask, offer)

    headers["Message-ID"] = "<offers/#{offer.id}@juicr.club>"
    headers["In-Reply_To"] = "<ask/#{ask.id}@juicr.club>"
    headers["References"] = "<ask/#{ask.id}@juicr.club>"

    @user = user
    @ask = ask
    @offer = offer

    mail(to: user.email, subject: "New offer on #{ask.project_name}")

  end
end
