import CoreUI
import UIKit
import UtilityModel

extension Navigator {
    public func presentSendFeedback(
        on presentingViewController: UIViewController
    ) {
        presentSendEmail(
            addresses: ["kasey.podtalk+KaseyTemplate@gmail.com"], // TODO: Replace
            subject: "App Feedback",
            body: nil,
            on: presentingViewController
        )
    }
    
    public func presentSendEmail(
        addresses: [String],
        subject: String?,
        body: String?,
        on presentingViewController: UIViewController
    ) {
        guard addresses.isEmpty == false else {
            let requiredData: AlertModel = .okAlert(
                title: "No email addresses found"
            )
            presentAlert(requiredData: requiredData, on: presentingViewController)
            return
        }
        
        let uniques: [String] = Set(addresses).sorted(by: <)
        presentComposeEmail(
            to: uniques,
            subject: subject,
            body: body,
            on: presentingViewController
        )
    }
                
    private func presentComposeEmail(
        to addresses: [String],
        subject: String?,
        body: String?,
        on presentingViewController: UIViewController
    ) {
        do {
            try presentingViewController.sendEmail(
                to: addresses,
                subject: subject,
                body: body
            )
        } catch {
            presentAlert(
                requiredData: .okAlert(title: "Email account not found"),
                on: presentingViewController
            )
        }
    }
}

import MessageUI

// MARK: - Email
extension UIViewController: @preconcurrency @retroactive MFMailComposeViewControllerDelegate {
    func sendEmail(
        to addresses: [String],
        subject: String? = nil,
        body: String? = nil
    ) throws {
        guard MFMailComposeViewController.canSendMail() else {
            throw EmailError.cannotSendMailOnThisDevice
        }
        let toRecipents = addresses
        let mc: MFMailComposeViewController = MFMailComposeViewController()
        mc.mailComposeDelegate = self
        subject.map { mc.setSubject($0) }
        body.map { mc.setMessageBody($0, isHTML: false) }
        mc.setToRecipients(toRecipents)
        
        present(mc, animated: true, completion: nil)
    }
    
    public func mailComposeController(
        _ controller:MFMailComposeViewController,
        didFinishWith result:MFMailComposeResult,
        error:Error?
    ) {
        dismiss(animated: true)
    }
    
    enum EmailError: Error {
        case cannotSendMailOnThisDevice
    }
}
