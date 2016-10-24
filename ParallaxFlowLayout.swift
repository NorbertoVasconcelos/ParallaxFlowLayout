//
//  ParallaxFlowLayout.swift
//
//  Created by Norberto Vasconcelos on 02/08/16.
//  Copyright © 2016 Norberto Vasconcelos. All rights reserved.
//

import UIKit

class ParallaxFlowLayout: UICollectionViewFlowLayout {
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        // This will schedule calls to layoutAttributesForElementsInRect: as the
        // collectionView is scrolling.
        return true
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        // First get the superclass attributes.
        let attributes = super.layoutAttributesForElements(in: rect)
        
        if let collectionView = collectionView {
            let insets:UIEdgeInsets = collectionView.contentInset
            let offset:CGPoint = collectionView.contentOffset
            
            let minY:CGFloat = -insets.top
            
            // Figure out how much we've pulled down
            let deltaY:CGFloat = fabs(offset.y - minY)
            
            for attrs in attributes ?? [] {
                // Locate the header attributes
                let kind = attrs.representedElementKind
                if kind == UICollectionElementKindSectionHeader &&
                    attrs.frame.size.height >= self.headerReferenceSize.height {
                    
                    // Adjust the header's height and y based on how much the user
                    // has pulled down.
                    let headerSize = self.headerReferenceSize
                    var headerRect = attrs.frame
                    
                    if offset.y < minY {
                        headerRect.size.height = max(minY, headerSize.height + deltaY)
                        headerRect.origin.y = headerRect.origin.y - deltaY
                    } else {
                        headerRect.size.height = max(0, headerSize.height - deltaY)
                        headerRect.origin.y = headerRect.origin.y + deltaY
                    }
                    attrs.frame = headerRect
                    
                    // Send header view to back
                    attrs.zIndex = -1
                }
            }
            
            return attributes
            
        }
        
        return nil
    }
}
