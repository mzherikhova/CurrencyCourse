//
//  CurrencyListViewController.swift
//  CurrencyCourse
//
//  Created by Margarita Zherikhova on 17.12.2017.
//  Copyright © 2017 Margarita Zherikhova. All rights reserved.
//

import UIKit
import AlamofireImage

private let cellIdentifier = "\(CurrencyListViewCell.self)"

class CurrencyListViewController: UICollectionViewController {
    
    var viewModel: CurrencyListViewModel? {
        didSet {
            loader(show: true)
            viewModel?.updateCurrency { [weak self] in
                self?.loader(show: false)
                self?.collectionView?.reloadData()
            }
        }
    }
    
    @IBOutlet private weak var activityView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register cell classes
        setupCollectionView()

        title = "Currencies"
        
        loader(show: true)
        viewModel?.updateCurrency { [weak self] in
            self?.loader(show: false)
            self?.collectionView?.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel?.coutOfCurrencies() ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CurrencyListViewCell

        if let currency = viewModel?.currencyArray[indexPath.item] {
            cell.codeLabel.text = currency.charCode
            cell.valueLabel.text = "\(currency.value)"
            cell.flagImage.af_setImage(withURL: URLConstants.flagUrl(forCountryByCode: currency.charCode))
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        if let item = viewModel?.currencyArray[indexPath.item] {
            let vc = storyboard?.instantiateViewController(withIdentifier: "\(DetailsTableViewController.self)") as! DetailsTableViewController
            vc.currency = item
            navigationController?.pushViewController(vc, animated: true)
        }
    }
  
    // MARK: - table view
    private func setupCollectionView() {
        collectionView?.register(UINib(nibName: cellIdentifier, bundle: Bundle.main),
                                 forCellWithReuseIdentifier: cellIdentifier)
    }
    
    private func loader(show: Bool) {
        activityView?.isHidden = !show
        show ? activityView?.startAnimating() : activityView?.startAnimating()
    }
}

extension CurrencyListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = view.frame.size.height
        let width = view.frame.size.width
        let picDimension = width / (width < height ? 2.0 : 3.0)
        return CGSize(width: picDimension, height: 75)
    }
}
