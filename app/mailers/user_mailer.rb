class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def loan_created_email(book_loan)
    @title = book_loan.book.title
    @date = book_loan.due_date
    mail(to: book_loan.user.email, subject: 'Your loan is succeed')
  end

  def due_date_notification_email(book_loan)
    @title = book_loan.book.title
    @date = book_loan.due_date
    mail(to: book_loan.user.email, subject: 'The day is close')
  end

end
