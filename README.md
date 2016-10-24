# ParallaxFlowLayout
UICollectionViewFlowLayout that provides a Parallax effect.

# Code Example

```swift
// Initialize and setup the ParallaxFlowLayout:
let layout = ParallaxFlowLayout()
layout.headerReferenceSize = CGSize(width: screenSize.width, height: 200)
layout.minimumLineSpacing = 0.0
layout.minimumInteritemSpacing = 0.0
layout.scrollDirection = UICollectionViewScrollDirection.vertical

```

```swift

// Add the layout to the collectionView:
self.collectionView?.collectionViewLayout = layout

```

Don't forget to add a section header to your collectionView!

# Installation
Simple! Just add the ParallaxFlowLayout file to your project.
