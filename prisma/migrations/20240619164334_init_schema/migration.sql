-- CreateTable
CREATE TABLE "Product" (
    "id" SERIAL NOT NULL,
    "isAvailable" BOOLEAN NOT NULL,
    "barcode" TEXT,
    "productName" TEXT NOT NULL,
    "productDescription" TEXT NOT NULL,
    "brand" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "subCategory" TEXT NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "mrp" DOUBLE PRECISION NOT NULL,
    "discount" DOUBLE PRECISION,
    "stockCount" INTEGER NOT NULL,
    "minSelectableQuantity" INTEGER NOT NULL,
    "maxSelectableQuantity" INTEGER NOT NULL,
    "selectableQuantity" INTEGER NOT NULL,
    "weight" TEXT NOT NULL,
    "weightSIUnit" TEXT NOT NULL,
    "productLife" TEXT,
    "productType" TEXT NOT NULL,
    "productIsFoodItem" TEXT NOT NULL,
    "keywords" TEXT[],
    "productImage" TEXT[],

    CONSTRAINT "Product_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Variation" (
    "id" SERIAL NOT NULL,
    "productId" INTEGER NOT NULL,
    "color" TEXT NOT NULL,
    "size" TEXT NOT NULL,
    "stockCount" INTEGER NOT NULL,

    CONSTRAINT "Variation_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Product_barcode_key" ON "Product"("barcode");

-- AddForeignKey
ALTER TABLE "Variation" ADD CONSTRAINT "Variation_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
