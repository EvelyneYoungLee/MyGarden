package my.garden.service;

import java.util.List;

import my.garden.dto.ProductsDTO;

public interface ProductsService {
	public int insertProductsService(ProductsDTO dto) throws Exception;
	public int insertImageFileService(String title, String imgs) throws Exception;
	public List<ProductsDTO> selectProductsListByCategoryService(int start, int end, String category) throws Exception;
	public List<ProductsDTO> selectProductsListByPageService(int start, int end) throws Exception;
	public ProductsDTO selectOneProductService(int pnumber) throws Exception;
	public int deleteProductService(int pnumber);
	public int updateProductService(ProductsDTO dto) throws Exception;
	public List<ProductsDTO> selectProductsListByKeywordService(int start, int end, String keyword) throws Exception;
}
