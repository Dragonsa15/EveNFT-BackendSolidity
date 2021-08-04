// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract EtherPage {
    
    // Core structure
    struct Pixel {
        uint16 price;
        bytes3 color;
    }

    struct Block {
        address owner;
        Pixel [2500] pixels;
        uint16 rows;
        uint16 columns;
        uint16 blocks;
    }
    
    struct Canvas {
        Block [10000] blocks;
        uint16 n_blocks;
        uint16 rows;
        uint16 columns;
    }
    
    
    
    Canvas[] private canvases;
    // Create object with given block divisions
    constructor () {
    }
    
    function addCanvas(uint16 _rows,uint16 _columns, uint16 _blocks) public {
        canvases.push();
        Canvas storage newCanvas = canvases[canvases.length - 1];
        newCanvas.rows = _rows;
        newCanvas.columns = _columns;
        newCanvas.n_blocks = _blocks;
        
        // canvases.push(Canvas(_rows, _columns, _blocks));
    }
    
    
    
    // function getCanvas(uint16 _canvas_index) public returns (Block[] memory canvas) {
    //     Canvas storage cv = canvases[_canvas_index];
    //     return cv.blocks[0:cv.n_blocks];
    // }
    
    function ValidateIndex(uint _canvas_id, uint req_block_index,uint req_pixel_index) view public returns(bool) {
        
        if (canvases.length <= _canvas_id) return false;
        
        Canvas storage canvas = canvases[_canvas_id];
        
        if(req_block_index < canvas.n_blocks) {
            if(req_pixel_index < canvas.rows * canvas.columns) {
                return true;
            }
            else {
                return false;
            }
        }
        else {
            return false;
        }
    }
    
    function getPixel (uint _canvas_id, uint16 block_index,uint16 pixel_index) view public returns (Pixel memory _any) {
        if(ValidateIndex(_canvas_id, block_index, pixel_index)) {
            return canvases[_canvas_id].blocks[block_index].pixels[pixel_index];
        }
        return Pixel(0, 0x000000);
    }
    
    function ChangePixel (uint _canvas_id, uint16 block_index, uint16 pixel_index, bytes3 color) public {
        if(ValidateIndex(_canvas_id, block_index, pixel_index)) {
            canvases[_canvas_id].blocks[block_index].pixels[pixel_index].color = color;    
        }
    }
    
    // addBlock(uint16 _rows, uint16 _columns) {
        
    // }

    // Events
    // event PixelChange (uint16 x, uint16 y, bytes3 color);
    
    // Public getter function created on mentioning public keyword
    // Canvas public canvas;
    
    
    
    // Color selected pixel
    // function colorPixel(uint16 x, uint16 y, bytes3 color) public {
    //     canvas.pixels[x][y] = color;
    //     emit PixelChange(x, y, color);
    // }
    
    
    // function getCanvas() public view returns (Canvas memory) {
    //     return canvas;
    // }

}